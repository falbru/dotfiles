define-command ide %{
    rename-client main
    set-option global jumpclient main

    kakqt-split-horizontal rename-client tools
    set-option global toolsclient tools

    # make this a hook for all newly created clients?
    define-command -override main -params .. %{
        evaluate-commands %sh{
            if [ ${#1} -eq 0 ]; then
                printf "%s" "focus main"
            else
                printf "%s" "evaluate-commands -client main %arg{@}"
            fi
        }
    }
    complete-command main command

    define-command -override tools -params .. %{
        evaluate-commands %sh{
            if [ ${#1} -eq 0 ]; then
                printf "%s" "focus tools"
            else
                printf "%s" "evaluate-commands -client tools %arg{@}"
            fi
        }
    }
    complete-command tools command
}
