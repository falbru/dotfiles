declare-option -hidden str swap_buffer_target
define-command swap-buffer-with -override -params 1 -client-completion %{
    set-option global swap_buffer_target %val{bufname}
    edit -scratch # release current window for other client
    evaluate-commands -client %arg{1} "
        set-option global swap_buffer_target %%val{bufname}
        buffer %opt{swap_buffer_target}
    "
    delete-buffer # delete the temporary scratch buffer
    buffer %opt{swap_buffer_target}
}
