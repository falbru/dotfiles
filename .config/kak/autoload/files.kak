declare-option str files_cwd %sh{ pwd }
declare-option bool files_show_hidden false

hook global BufSetOption filetype=files %{
    add-highlighter buffer/ regex '^[^\s]+/' 0:blue
    add-highlighter buffer/ regex '^[^\s]+@' 0:yellow

    map buffer normal <ret> 'x_s^(.*?(?=@)|.*$)<ret>:files-edit-or-cd %val{selections}<ret>'
    map buffer normal <backspace> ':files-cd-parent<ret>'

    hook buffer NormalIdle ".*" %{ evaluate-commands %sh{
        echo "info $(realpath --relative-to=$(pwd) $kak_opt_files_cwd)"
    }}
}

# TODO Remove -override and add docstrings
define-command -override files-goto -params 1 %{
    evaluate-commands %sh{
        # TODO this apparently doesn't work if $1 is not inside root of kakoune
        buffer_file=$(readlink -f $1)

        [ ! -f $buffer_file ] && return

        buffer_directory=$(dirname $buffer_file)
        echo "evaluate-commands -buffer *files* %{ set-option buffer files_cwd $buffer_directory }"
        echo "files-refresh"
        echo "execute-keys -try-client '$kak_opt_toolsclient' '<esc><esc>/^$(basename $buffer_file)\$<ret>'"
    }
}
complete-command -menu files-goto buffer

define-command -override files-follow %{
    # TODO files-follow behaves broken if there is no toolsclient
    hook global -group files-follow WinDisplay .* %{
        files-goto %val{buffile}
    }
    files-goto %val{buffile}
}

define-command -override files-unfollow %{
    remove-hooks global files-follow
}

define-command -override files-new %{
    evaluate-commands -try-client %opt{toolsclient} %{
        edit -scratch "*files*"
        set-option buffer filetype 'files'
        set-option buffer files_cwd %sh{ pwd }

        files-refresh
    }
}

define-command -override files-new-or-focus %{
    try %{
        evaluate-commands -try-client %opt{toolsclient} %{ buffer "*files*" }
    } catch %{
        files-new
    }
    try %{ kakqt-focus %opt{toolsclient} }
}

define-command -override files-refresh -params ..1 %{
    evaluate-commands -try-client %opt{toolsclient} %sh{
        ls_command='ls --file-type --group-directories-first $kak_opt_files_cwd'

        echo "buffer *files*"
        echo "set-option buffer readonly false"
        if [ $1 = "-restore" ]; then
            echo "execute-keys 'x<a-s>Z%|$ls_command<ret>z<esc>'"
        else
            echo "execute-keys '%|$ls_command<ret>gg'"
        fi
        echo "set-option buffer readonly true"
    }
}

define-command -override files-edit-or-cd -params 1.. %{
    evaluate-commands %sh{
        file_path="$kak_opt_files_cwd/$1"
        if [ -f $file_path ]; then
            echo "evaluate-commands -try-client '$kak_opt_jumpclient' %{ edit $file_path }"
        elif [ -d $file_path ]; then
            echo "files-cd $file_path"
        else
            echo "echo $file_path is not a valid file"
        fi
    }
}

define-command -override files-cd -params 1 %{
    evaluate-commands -try-client %opt{toolsclient} %sh{
        new_files_cwd=$(cd "$kak_opt_files_cwd" && readlink -f $1)
        echo "buffer '*files*'"
        echo "set-option buffer files_cwd '$new_files_cwd'"
        echo "files-refresh"
        if [ $(dirname $kak_opt_files_cwd) = $new_files_cwd ]; then
            echo "execute-keys '<esc><esc>/^$(basename $kak_opt_files_cwd)/\$<ret>'"
        fi
    }
}

define-command -override files-cd-parent %{
    evaluate-commands -try-client %opt{toolsclient} %{
        buffer "*files*"
        files-cd %sh{ cd $kak_opt_files_cwd && dirname $kak_opt_files_cwd }
    }
}

define-command -override files-cd-root %{
    evaluate-commands -try-client %opt{toolsclient} %{
        buffer "*files*"
        files-cd %sh{ pwd }
    }
}

define-command -override files-touch -params 1.. %{
    evaluate-commands -try-client %opt{toolsclient} %sh{
        echo "buffer '*files*'"
        cd $kak_opt_files_cwd
        touch $@
        echo "files-refresh -restore"
    }
}
# TODO add complete-command

define-command -override files-rm -params 1.. %{
    evaluate-commands -try-client %opt{toolsclient} %sh{
        echo "buffer '*files*'"
        cd $kak_opt_files_cwd
        rm $@
        echo "files-refresh -restore"
    }
}
# TODO add complete-command

define-command -override files-mkdir -params 1.. %{
    evaluate-commands -try-client %opt{toolsclient} %sh{
        echo "buffer '*files*'"
        cd $kak_opt_files_cwd
        mkdir $@
        echo "files-refresh -restore"
    }
}
# TODO add complete-command
