define-command cp -params 1 %{
  write -- %arg{1}
  edit -- %arg{1}
}

define-command cp! -params 1 %{
  write! -- %arg{1}
  edit! -- %arg{1}
}

complete-command cp file
complete-command cp! file
