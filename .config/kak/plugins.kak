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

# Custom status line
declare-option -hidden str lsp_modeline_progress ""
define-command -hidden -params 6 -override lsp-handle-progress %{
set-option global lsp_modeline_progress %sh{
  if ! "$6"; then
    echo "$2${5:+" ($5%)"}${4:+": $4"}"
  fi
}
}

hook global WinSetOption filetype=(javascript|typescript|c|cpp|python|go) %{
    set-option window lsp_auto_highlight_references true
    set-option window lsp_hover_max_lines 1000
    set-option window lsp_hover_anchor true
    set-option window lsp_snippet_support false

    map window user -docstring 'enter lsp mode' l ':enter-user-mode lsp<ret>'
    map window user -docstring 'open lsp diagnostics buffer' d ':lsp-diagnostics<ret>'
    hook window -always BufOpenFifo '\*diagnostics\*' %{ map window normal <minus> ':lsp-find-error<ret>' }

    map window normal -docstring 'open lsp hover' = ':lsp-hover<ret>'
    map window normal -docstring 'open lsp code actions' <a-=> ':lsp-code-actions<ret>'

    map window object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    map window object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    map window object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
    map window object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
    map window object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
    map window object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

    lsp-auto-hover-insert-mode-enable
    lsp-inlay-diagnostics-enable window
    lsp-enable-window
}

bundle kak-rainbower "https://github.com/crizan/kak-rainbower" %{
    # TODO doesnt work
    # set-option global rainbow_mode 0
    # set-option global rainbow_check_templates Y

    # hook global WinCreate .* %{
    #   rainbow-enable-window
    # }
}

# bundle kakoune-focus "https://github.com/caksoylar/kakoune-focus" %{
#     map global user <space> ':focus-toggle<ret>' -docstring "toggle selections focus"
# }

bundle grep-expand.kak https://github.com/jtrv/grep-expand.kak

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

bundle kakoune-grep-write "https://github.com/JacobTravers/kakoune-grep-write" %{
  hook global WinSetOption filetype=(grep|lsp-goto) %{
    alias buffer w grep-write
  }
}

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
