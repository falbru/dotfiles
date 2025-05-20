define-command -override git-push -params .. -docstring 'git-push: Update remote refs along with associated objects' %{ evaluate-commands %sh{
    if output=$(git push $1 2>&1); then
        printf "echo -markup '{Information}switched to %s'" "$1"
    else
        printf "fail %s" "$output"
    fi
}}
