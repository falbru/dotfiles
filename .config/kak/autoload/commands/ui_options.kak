define-command -override ui-options-edit %{
    edit -scratch *ui_options*
    execute-keys "!echo $kak_quoted_opt_ui_options<ret>"
    evaluate-commands -buffer *ui_options* %{
        set-option buffer filetype toml
    }
}
