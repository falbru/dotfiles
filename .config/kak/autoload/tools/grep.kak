declare-user-mode grep

map global grep -docstring 'grep buffer' b ':buffer *grep*<ret>'
map global grep -docstring 'next match' n ':grep-next-match<ret>'
map global grep -docstring 'previous match' <a-n> ':grep-previous-match<ret>'
