define-command git-log -params .. -docstring 'git-log [<options>] [<revision range>] [[--] <path>...]: Show commit logs' %{
    evaluate-commands -try-client %opt{toolsclient} %sh{
        output=$(mktemp -d "${TMPDIR:-/tmp}"/kak-git.XXXXXXXX)/fifo
        mkfifo "$output"
        ( trap - INT QUIT; git log "$@" > "$output" 2>&1 & ) > /dev/null 2>&1 < /dev/null
        printf '%s\n' "evaluate-commands %{
            edit! -fifo ${output} *git-log*
            set-option buffer filetype git-log
            hook -always -once buffer BufCloseFifo .* %{ nop %sh{ rm -r $(dirname ${output}) } }
        }"
    }
}

complete-command git-log shell-script-candidates %{
    printf '%s\n' --oneline --graph --all --stat --decorate -p --follow --no-merges
    git for-each-ref --format='%(refname:short)' refs/heads/ refs/tags/
}
