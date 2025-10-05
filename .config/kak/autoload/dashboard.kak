define-command -docstring 'open dashboard buffer' dashboard %{
    edit -scratch *dashboard*
}

hook global WinCreate '\*dashboard\*' %{
    evaluate-commands -save-regs S %{
    set-register S \
" _  __     _
| |/ /__ _| | _____  _   _ _ __   ___
| ' // _` | |/ / _ \| | | | '_ \ / _ \
| . \ (_| |   < (_) | |_| | | | |  __/
|_|\_\__,_|_|\_\___/ \__,_|_| |_|\___|

Commands:
- Run [i]de

Recent files:
"
    execute-keys <esc><esc> <percent> <">S R
    execute-keys "ge<a-!>cat %opt{recentf_file} | grep -e ^$PWD | awk '!seen[$0]++' | sed s#^$PWD/## | tail | tac<ret>"

    add-highlighter -override buffer/ line 1 title
    add-highlighter -override buffer/ line 2 title
    add-highlighter -override buffer/ line 3 title
    add-highlighter -override buffer/ line 4 title
    add-highlighter -override buffer/ line 5 title
    add-highlighter -override buffer/ regex '^(Commands:|Recent files:)$' 0:header

    map window normal <ret> 'x_:evaluate-commands %sh{ for selection in $kak_selections; do printf "edit %s; " "$selection"; done; echo "db *dashboard*"; } <ret>'
    map window normal i ":ide<ret>"
    }

    hook -once global WinDisplay '\*dashboard\*' %{
        execute-keys '11g'
    }
}
