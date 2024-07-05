source "%val{config}/bundle/kak-bundle/rc/kak-bundle.kak"
bundle-noload kak-bundle https://codeberg.org/jdugan6240/kak-bundle

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

# kakoune-lf
bundle kakoune-lf https://github.com/TeddyDD/kakoune-lf

# golang.kak
bundle golang.kak https://github.com/chriswalker/golang.kak

# kak-harpoon
bundle kak-harpoon https://github.com/raiguard/kak-harpoon %{
    harpoon-add-bindings
}

# kaktree
bundle kaktree https://git.sr.ht/~teddy/kaktree %{
    hook global WinSetOption filetype=kaktree %{
        remove-highlighter buffer/numbers
        remove-highlighter buffer/matching
        remove-highlighter buffer/wrap
        remove-highlighter buffer/show-whitespaces
    }
    kaktree-enable
}

# kak-tree-sitter
# eval %sh{ kak-tree-sitter -dks --init $kak_session --with-text-objects }

# smarttab.kak
# bundle smarttab.kak "https://github.com/andreyorst/smarttab.kak" %{
#     hook global ModuleLoaded smarttab %{ hook global WinSetOption filetype=.* %{ set-option buffer softtabstop %opt{tabstop} } }
#     hook global WinSetOption filetype=(sh|kak|zig|javascript|typescript|css|html|yaml|meson|c|cpp) expandtab
#     hook global WinSetOption filetype=(python) smarttab
# }
#
