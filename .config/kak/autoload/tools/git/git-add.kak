define-command git-add -params .. -docstring 'git-add [files...]: Add files to the index' %{ evaluate-commands %sh{
    files="$@"

    if [ -z "$files" ]; then
        files="$kak_buffile"
    fi

    if output=$(git add -v $files 2>&1); then
        file_count=$(echo "$output" | grep -c "^add")
        printf "echo -markup '{Information}%s files added'" "$file_count"
    else
        printf "fail %s" "$output"
    fi
}}

complete-command git-add shell-script-candidates %{
    git ls-files -dmo --exclude-standard
}
