define-command find -docstring "find files" -params 1 %{ edit %arg{1} }
complete-command find shell-script-candidates %{ fd -t f -c never }
