define-command diff-buffer -params 1.. -docstring "diff-buffer <buffer>: use diff" %{
    evaluate-commands %sh{
        buffer_a=$(mktemp /tmp/diff-buffer.XXXXXX)
        buffer_b=$(mktemp /tmp/diff-buffer.XXXXXX)
        printf "%s\n" "evaluate-commands -buffer $kak_bufname %{ execute-keys '%:echo-to-file $buffer_a %val{selection}' }"
        printf "%s\n" "evaluate-commands -buffer $1 %{ execute-keys '%:echo-to-file $buffer_b %val{selection}' }"

        buffiles=""
        args="$@"
        eval "set -- $kak_buflist"
        for buf; do
            case "$buf" in
                \**\*) ;;
                *) buffiles="$buffiles $buf" ;;
            esac
        done
        if [ -n "$buffiles" ]; then
            printf "grep %s %s" "$args" "$buffiles"
        else
            printf "echo -markup '{Error}No file buffers to grep'"
        fi
    }
}

complete-command diff-buffer buffer
