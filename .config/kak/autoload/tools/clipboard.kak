evaluate-commands %sh{
    if [ -n "$SSH_TTY" ]; then
        copy='printf "\033]52;;%s\033\\" $(base64 | tr -d "\n") > $( [ -n "$kak_client_pid" ] && echo /proc/$kak_client_pid/fd/0 || echo /dev/tty )'
        paste='printf "paste unsupported through ssh"'
        backend="OSC 52"
    else
        case $(uname) in
            Linux)
                if [ -n "$WAYLAND_DISPLAY" ]; then
                    copy="wl-copy"; paste="wl-paste"; backend=Wayland
                else
                    copy="xclip -i -selection clipboard"; paste="xclip -o -selection clipboard"; backend=X11
                fi
                ;;
            Darwin)  copy="pbcopy"; paste="pbpaste"; backend=OSX ;;
        esac
    fi
    printf "map global user -docstring 'paste (after) from clipboard' p '<a-!>%s<ret>'\n" "$paste"
    printf "map global user -docstring 'paste (before) from clipboard' P '!%s<ret>'\n" "$paste"
    printf "map global user -docstring 'yank to primary' y '<a-|>%s<ret>:echo -markup %%{{Information}copied selection to %s clipboard}<ret>'\n" "$copy" "$backend"
    printf "map global user -docstring 'replace from clipboard' R '|%s<ret>'\n" "$paste"
}
