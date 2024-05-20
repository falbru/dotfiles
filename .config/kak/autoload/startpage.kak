define-command startpage %{
    evaluate-commands %{
    edit -scratch *startpage*
    set-register S \
" _  __     _
| |/ /__ _| | _____  _   _ _ __   ___
| ' // _` | |/ / _ \| | | | '_ \ / _ \
| . \ (_| |   < (_) | |_| | | | |  __/
|_|\_\__,_|_|\_\___/ \__,_|_| |_|\___|

Recent projects:
"
    execute-keys <esc><esc> <percent> <">S R
    execute-keys "ge<a-!>tac ~/.kak_history | awk '!seen[$0]++' | tail<ret>"
    execute-keys '8g'

    add-highlighter -override buffer/ regex '^Recent projects:$' 0:header

    map buffer normal <ret> "x_:open-project <c-r>.<ret>"
    }
}
