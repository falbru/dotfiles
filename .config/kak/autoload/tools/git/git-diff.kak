define-command git-diff -params 1 -docstring 'git-diff <commit>: Show changes between commits, commit and working tree, etc' %{ evaluate-commands %sh{
    if output=$(git diff $1 2>&1); then
        printf "echo -markup '{Information}switched to %s'" "$1"
    else
        printf "fail %s" "$output"
    fi
}}

