define-command -override xdg-open -params 0..1 %{ { xdg-open $1 } > /dev/null 2>&1 < /dev/null & }
complete-command xdg-open file
