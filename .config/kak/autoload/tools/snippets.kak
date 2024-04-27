define-command insert-snippet -params 1 %{
    execute-keys "|cat ~/.config/kak/snippets/%arg{1}<ret>s\$\d<ret>"
}

complete-command -menu insert-snippet shell-script-candidates %{
    fd --type file . ~/.config/kak/snippets/ | awk -F '/' '{print $NF}'
}
