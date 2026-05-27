define-command git-ignore -params 0..1 -docstring 'git-ignore [-unignore] [<gitignore path>]: Exclude file from being tracked by git (default: ignore)' %{
    evaluate-commands %sh{
        filepath="$kak_buffile"
        if gitroot=$(git rev-parse --show-toplevel 2>/dev/null); then
            filepath=$(realpath --relative-to="$gitroot" "$kak_buffile")
        fi

        if [ -z "$filepath" ]; then
            echo "fail 'File is not tracked by git'"
            exit
        fi

        ignore_flag=true
        if [ "$1" = "-unignore" ]; then
            ignore_flag=false
            shift
        fi

        ignore_file=${1:-".gitignore"}

        if $ignore_flag; then
            echo "echo ignored..."
            if grep -Fxq "$filepath" "$ignore_file" 2>/dev/null; then
                echo "echo 'Already in $ignore_file: $filepath'"
            else
                echo "$filepath" >> "$ignore_file"
                echo "echo 'Added to $ignore_file: $filepath'"
            fi
        else
            if grep -Fxq "$filepath" "$ignore_file" 2>/dev/null; then
                sed -i "\|^${filepath}$|d" "$ignore_file"
                echo "echo 'Removed from $ignore_file: $filepath'"
            else
                echo "echo 'Not in $ignore_file: $filepath'"
            fi
        fi
    }
}

complete-command git-ignore file
