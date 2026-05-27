define-command snippet-insert -params 1 %{
	evaluate-commands %sh{
		snippet_file=$(find ~/.config/kak/snippets -name "$1" -type f | head -1)
		if [ -f "$snippet_file" ]; then
			if [ "$kak_opt_indentwidth" -eq 0 ]; then
    			printf "execute-keys '|cat %s<ret>s\\\$\\\d+<ret>'" "$snippet_file"
			else
				printf "execute-keys '|cat %s<ret>@s\\\$\\\d+<ret>'" "$snippet_file"
			fi
		fi
	}
}
complete-command -menu snippet-insert shell-script-candidates %{
    cd ~/.config/kak/snippets/ && {
        find . -maxdepth 1 -type f -not -name '.editorconfig' | awk -F '/' '{print $NF}'
        if [ -d "$kak_opt_filetype" ]; then
            find "$kak_opt_filetype" -type f -not -name '.editorconfig' | awk -F '/' '{print $NF}'
        fi
    }
}

define-command snippet-edit -params 1 %{
    edit "~/.config/kak/snippets/%arg{1}"
}

complete-command snippet-edit shell-script-candidates %{
    find ~/.config/kak/snippets/ -type f -not -name '.editorconfig' -printf '%P\n'
}
