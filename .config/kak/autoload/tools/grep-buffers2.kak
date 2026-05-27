define-command grep-buffers -params 1.. -docstring "grep in all open file buffers" %{
    evaluate-commands %sh{
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





