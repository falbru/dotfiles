define-command snippet-insert -params 1 %{
    execute-keys "|find ~/.config/kak/snippets -name '%arg{1}' -type f | head -1 | xargs cat<ret>s\$\d+<ret>"
}

complete-command -menu snippet-insert shell-script-candidates %{
    cd ~/.config/kak/snippets/ && {
        find . -maxdepth 1 -type f | awk -F '/' '{print $NF}'
        if [ -d "$kak_opt_filetype" ]; then
            find "$kak_opt_filetype" -type f | awk -F '/' '{print $NF}'
        fi
    }
}

define-command snippet-edit -params 1 %{
    if [ -f "~/.config/kak/snippets/%arg{1}" ]; then
        edit "~/.config/kak/snippets/%arg{1}"
    elif [ -f "~/.config/kak/snippets/$kak_opt_filetype/%arg{1}" ]; then
        edit "~/.config/kak/snippets/$kak_opt_filetype/%arg{1}"
    else
        edit "~/.config/kak/snippets/%arg{1}"
    fi
}

complete-command snippet-edit shell-script-candidates %{
    cd ~/.config/kak/snippets/ && {
        find . -maxdepth 1 -type f | awk -F '/' '{print $NF}'
        if [ -d "$kak_opt_filetype" ]; then
            find "$kak_opt_filetype" -type f | awk -F '/' '{print $NF}'
        fi
    }
}
