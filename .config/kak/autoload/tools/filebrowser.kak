define-command filebrowser -docstring "open root directory in the file browser " %{
    nop %sh{ flatpak-spawn --host xdg-open . }
}
