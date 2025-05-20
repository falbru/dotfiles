define-command -override sc-chat -params .. %{
    evaluate-commands -try-client %opt{toolsclient} %{
        edit -scratch *sc*
        set-option buffer filetype 'markdown'
        execute-keys "ge\o> %arg{@}<esc><percent>|sc -er"
    }
}
