define-command cp -params 1 %{
  write -- %arg{1}
  edit -- %arg{1}
}

complete-command cp file
