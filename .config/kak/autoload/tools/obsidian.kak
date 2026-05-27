declare-option str obsidian_vault_dir ""

define-command -override -docstring 'obsidian <filename>: Edit a note in an obsidian vault' -params 1 obsidian %{
    evaluate-commands -try-client %opt{docsclient} %{ edit "%opt{obsidian_vault_dir}/%arg{1}" }
}

complete-command -menu obsidian shell-script-candidates %{
    [ -z "$kak_opt_obsidian_vault_dir" ] && exit

    cd $kak_opt_obsidian_vault_dir
    find . -name '*.md'
}
