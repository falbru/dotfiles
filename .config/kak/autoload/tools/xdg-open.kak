define-command xdg-open -params .. %{ nop %sh{ xdg-open $1 } }
complete-command xdg-open file
