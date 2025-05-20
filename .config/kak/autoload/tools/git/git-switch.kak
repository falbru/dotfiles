define-command git-switch -params 1 -docstring 'git-switch <branch>: Switch branches' %{ evaluate-commands %sh{
    if output=$(git switch $1 2>&1); then
        printf "echo -markup '{Information}switched to %s'" "$1"
    else
        printf "fail %s" "$output"
    fi
}}

complete-command git-switch shell-script-candidates %{
    git for-each-ref --format='%(refname:short)' refs/heads/
}
