# hook global FocusIn ^[?!tools$].*$ %{
#     set-option global jumpclient %val{client}
# }

hook global FocusIn .* %{
    evaluate-commands %sh{
        for master in $kak_opt_kakodemon_masters; do
            if [ "$master" = "$kak_client" ]; then
                printf "%s" "set-option global jumpclient $kak_client"
                break
            fi
        done
    }
}

define-command -override tools -params .. %{
    try %{
        evaluate-commands -client %opt{toolsclient} %arg{@}
    } catch %{
        set-option global toolsclient tools
        new %{
            rename-client tools; %arg{@}
        }
    }
}

complete-command -menu tools command
