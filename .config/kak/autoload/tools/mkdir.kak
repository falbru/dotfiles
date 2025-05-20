define-command mkdir -params .. %{
  evaluate-commands %sh{
    if [ $# -gt 0 ]; then
        dirs="$@"
    else
        dirs=$(dirname -- "$kak_buffile")
    fi
    mkdir -p -- $dirs ||
    printf "fail 'ERROR: mkdir exited with: %d.'" "$?"
    }
}

complete-command mkdir file
