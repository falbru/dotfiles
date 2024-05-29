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
    lsp-enable
}

# kak-tree-sitter
eval %sh{ kak-tree-sitter -dks --session $kak_session --with-text-objects }

# smarttab.kak
# bundle smarttab.kak "https://github.com/andreyorst/smarttab.kak" %{
#     hook global ModuleLoaded smarttab %{ hook global WinSetOption filetype=.* %{ set-option buffer softtabstop %opt{tabstop} } }
#     hook global WinSetOption filetype=(sh|kak|zig|javascript|typescript|css|html|yaml|meson|c|cpp) expandtab
#     hook global WinSetOption filetype=(python) smarttab
# }
