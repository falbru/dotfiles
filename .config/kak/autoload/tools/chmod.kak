define-command -docstring 'chmod <mode>: change the mode of the opened buffile' chmod -params 1.. %{
    evaluate-commands %sh{
        if chmod "$@" "$kak_buffile" 2>/dev/null; then
            new_mode=$(stat -c "%a" "$kak_buffile" 2>/dev/null)
            printf "echo 'Mode changed to %s'\n" "$new_mode"
        else
            printf "fail '%s'\n" "$(chmod "$@" "$kak_buffile" 2>&1)"
        fi
    }
}
