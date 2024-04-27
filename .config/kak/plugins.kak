source "%val{config}/bundle/kak-bundle/rc/kak-bundle.kak"
bundle-noload kak-bundle https://git.sr.ht/~jdugan6240/kak-bundle

# auto-pairs
bundle auto-pairs.kak "https://github.com/alexherbo2/auto-pairs.kak" %{
    enable-auto-pairs
}

# kak-ansi
bundle kak-ansi https://github.com/eraserhd/kak-ansi

# kak-lsp
eval %sh{kak-lsp --kakoune -s $kak_session}

hook global WinSetOption filetype=(javascript|typescript|c|cpp|python|go) %{
    map window user -docstring 'enter lsp mode' l ':enter-user-mode lsp<ret>'
    map window user -docstring 'open lsp diagnostics buffer' d ':lsp-diagnostics<ret>'
    hook window -always BufOpenFifo '\*diagnostics\*' %{ map window normal <minus> ':lsp-find-error<ret>' }

    map window normal -docstring 'open lsp hover' = ':lsp-hover<ret>'
    map window normal -docstring 'open lsp code actions' <a-=> ':lsp-code-actions<ret>'

    lsp-auto-hover-insert-mode-enable
    lsp-inlay-diagnostics-enable buffer
    lsp-enable-window
}

# kakoune-buffer-switcher
bundle kakoune-buffer-switcher "https://github.com/occivink/kakoune-buffer-switcher"
map global user -docstring 'open buffer switcher' b ':buffer-switcher<ret>'

define-command -docstring 'switch to buffer at index' -params 1 buffer-switch-index %{
    evaluate-commands %sh{
        non_debug_elements=$(echo "$kak_quoted_buflist" | tr ' ' '\n' | grep -v "\*debug\*" | tr '\n' ' ')
        selected_element=$(echo "$non_debug_elements" | cut -d "'" -f $(($1*2+2)))
        if [ -z $selected_element ]; then
            echo 'echo -markup "{Error}index out of range"'
        else
            echo "buffer $selected_element"
        fi
    }
}
map global normal <c-q> ':buffer-switch-index 0<ret>'
map global normal <c-w> ':buffer-switch-index 1<ret>'
map global normal <c-e> ':buffer-switch-index 2<ret>'
map global normal <c-r> ':buffer-switch-index 3<ret>'

# kakoune-filetree
bundle kakoune-filetree https://github.com/occivink/kakoune-filetree

# smarttab.kak
bundle smarttab.kak "https://github.com/andreyorst/smarttab.kak" %{
    hook global ModuleLoaded smarttab %{ hook global WinSetOption filetype=.* %{ set-option buffer softtabstop %opt{tabstop} } }
    hook global WinSetOption filetype=(sh|kak|zig|javascript|typescript|css|html|yaml|meson|c|cpp) expandtab
    hook global WinSetOption filetype=(python) smarttab
}
