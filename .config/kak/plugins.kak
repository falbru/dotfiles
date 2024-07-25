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

# kakoune-filetree
bundle kakoune-filetree https://github.com/occivink/kakoune-filetree.git

# kakoune-gdb
bundle kakoune-gdb https://github.com/occivink/kakoune-gdb

# grep-write.kak
bundle grep-write https://github.com/jtrv/grep-write.kak

# modeline-extras.kak
bundle modeline-extras https://github.com/basbebe/modeline-extras.kak %{
  # set-option global modeline-nerdfont true

  # # enable options
  # modeline-buffer-position-enable
  # modeline-git-branch-enable
  # modeline-indent-enable
  # modeline-lsp-enable

  # # Git branch + Filename
  # set-option global modelinefmt '{magenta+i}%opt{modeline_git_branch} {bright-blue+u}%val{bufname}{default}'
  # # Position
  # set-option -add global modelinefmt ' %val{cursor_line}:%val{cursor_char_column} %opt{modeline_buffer_position}{default}'
  # # Context Info + Mode Info
  # set-option -add global modelinefmt ' {{context_info}} {{mode_info}}'
  # # lsp
  # set-option -add global modelinefmt ' {DiagnosticError}%opt{modeline_lsp_err}{DiagnosticWarning}%opt{modeline_lsp_warn}{default}'
  # # Filetype + Indentwidth
  # set-option -add global modelinefmt ' %opt{filetype} %opt{modeline_indent}'
  # # client@session
  # set-option -add global modelinefmt ' {bright-cyan}%val{client}{bright-cyan+b}%val{session}'
}

bundle-noload one.kak https://github.com/raiguard/one.kak # Notice, no config block
bundle-install-hook one.kak %{
  mkdir -p ${kak_config}/colors
  ln -sf "${kak_opt_bundle_path}/one.kak" "${kak_config}/colors/"
}
