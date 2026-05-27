define-command -override -docstring '
config [<filename>]: edit kakoune config files
If no file is specified, edit kakrc
' -params ..1 config %{
    evaluate-commands %sh{
        if [ $# -eq 0 ]; then
            printf "%s" "edit '$kak_config/kakrc'"
        else
            printf "%s" "edit '$kak_config/$1'"
        fi

    }
}

complete-command -menu config shell-script-candidates %{
    git -C $kak_config ls-files -c .
}
