define-command snippet-insert -params 1 %{
    execute-keys "|cat ~/.config/kak/snippets/%arg{1}<ret>s\$\w+<ret>"
}

complete-command -menu snippet-insert shell-script-candidates %{
    cd ~/.config/kak/snippets/ && find . -type f | awk -F '/' '{print $NF}'
}

define-command snippet-edit -params 1 %{
    edit "~/.config/kak/snippets/%arg{1}"
}

complete-command snippet-edit shell-script-candidates %{
    ls ~/.config/kak/snippets/
}
