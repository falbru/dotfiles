define-command insert-snippet -params 1 %{
    execute-keys "|cat ~/.config/kak/snippets/%arg{1}<ret>s\$\d<ret>"
}

complete-command -menu insert-snippet shell-script-candidates %{
    cd ~/.config/kak/snippets/ && find . -type f | awk -F '/' '{print $NF}'
}
