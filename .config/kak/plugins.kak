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
eval %sh{kak-lsp}

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
    hook window -always BufOpenFifo '\*diagnostics\*' %{ map window normal <minus> ':lsp-find-error<ret>' }

    map window user -docstring 'open lsp hover' <space> ':lsp-hover<ret>'
    map window user -docstring 'open lsp code actions' <s-space> ':lsp-code-actions<ret>'

    # map window object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    # map window object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    # map window object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
    # map window object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
    # map window object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
    # map window object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

    lsp-auto-hover-insert-mode-enable
    lsp-inlay-diagnostics-enable window
    lsp-enable-window
}

# kak-tree-sitter
eval %sh{ kak-tree-sitter -dks --init $kak_session --with-highlighting }

# kakoune-gdb
bundle kakoune-gdb https://github.com/occivink/kakoune-gdb

# smarttab.kak
bundle smarttab.kak https://github.com/andreyorst/smarttab.kak.git

bundle kakoune-grep-write "https://github.com/JacobTravers/kakoune-grep-write" %{
  hook global WinSetOption filetype=(grep|lsp-goto) %{
    alias buffer w grep-write
  }
}

# kakoune-qt
hook global ModuleLoaded kakoune-qt %{
    alias global new kakqt-split-horizontal
    alias global focus kakqt-focus
}
