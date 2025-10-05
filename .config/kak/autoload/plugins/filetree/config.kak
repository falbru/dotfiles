map -docstring 'open filetree' global user t ':filetree-switch-or-start -files-first -consider-gitignore<ret>'
map -docstring 'in filetree' global goto F '<esc>:filetree-goto %val{bufname}<ret>'

hook global BufCreate '^\*filetree\*$' %{
    alias global f filetree-edit
}

hook global BufClose '^\*filetree\*$' %{
    alias global f find
}
