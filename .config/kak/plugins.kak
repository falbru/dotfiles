source "%val{config}/bundle/kak-bundle/rc/kak-bundle.kak"
bundle-noload kak-bundle https://codeberg.org/jdugan6240/kak-bundle

# auto-pairs
bundle auto-pairs.kak "https://github.com/alexherbo2/auto-pairs.kak" %{
    enable-auto-pairs
}

# kak-ansi
bundle kak-ansi https://github.com/eraserhd/kak-ansi %{
    hook global BufOpenFifo '.*' %{
        ansi-enable
    }
}

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

# kakoune-filetree
bundle kakoune-filetree https://github.com/occivink/kakoune-filetree.git

# kakoune-gdb
bundle kakoune-gdb https://github.com/occivink/kakoune-gdb

# smarttab.kak
bundle smarttab.kak https://github.com/andreyorst/smarttab.kak.git

# grep-write.kak
bundle grep-write https://github.com/jtrv/grep-write.kak

bundle-noload one.kak https://github.com/raiguard/one.kak
bundle-install-hook one.kak %{
  mkdir -p ${kak_config}/colors
  ln -sf "${kak_opt_bundle_path}/one.kak" "${kak_config}/colors/"
}

bundle-noload kakoune-selenized https://github.com/TeddyDD/kakoune-selenized
bundle-install-hook kakoune-selenized %{
  mkdir -p ${kak_config}/colors
  ln -sf "${kak_opt_bundle_path}/kakoune-selenized" "${kak_config}/colors/"
}

# kakoune-qt
hook global ModuleLoaded kakoune-qt %{
    alias global new kakqt-split-horizontal
    alias global focus kakqt-focus
}
