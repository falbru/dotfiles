define-command -override sc-chat -docstring 'sc-chat: Chat with sc in a custom buffer
Switches:
    -new: create a new chat
'-params .. %{
    evaluate-commands -try-client %opt{toolsclient} %{
        edit -scratch *sc*
        set-option buffer filetype 'markdown'
        execute-keys "ge\o> %arg{@}<esc><percent>|sc -er"
    }
}
