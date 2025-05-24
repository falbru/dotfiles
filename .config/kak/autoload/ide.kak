define-command ide %{
    rename-client ping
    kakqt-split-horizontal rename-client pong

    set-option global jumpclient ping
    set-option global docsclient pong
    set-option global toolsclient pong

    hook -group ide global FocusIn ping %{
        evaluate-commands %sh{
            if ! printf '%s' "$kak_bufname" | grep -q '^\*.*\*$'; then
                printf "%s\n" "set-option global jumpclient ping"
                printf "%s\n" "set-option global docsclient pong"
                printf "%s\n" "set-option global toolsclient pong"
            fi
        }
    }

    hook -group ide global FocusIn pong %{
        evaluate-commands %sh{
            if ! printf '%s' "$kak_bufname" | grep -q '^\*.*\*$'; then
                printf "%s\n" "set-option global jumpclient pong"
                printf "%s\n" "set-option global docsclient ping"
                printf "%s\n" "set-option global toolsclient ping"
            fi
        }
    }

    hook -group ide global WinDisplay ^[^*].*[^*]$ %{
        evaluate-commands %sh{
            if [ "$kak_client" = "ping" ]; then
                printf "%s\n" "set-option global jumpclient ping"
                printf "%s\n" "set-option global docsclient pong"
                printf "%s\n" "set-option global toolsclient pong"
            elif [ "$kak_client" = "pong" ]; then
                printf "%s\n" "set-option global jumpclient pong"
                printf "%s\n" "set-option global docsclient ping"
                printf "%s\n" "set-option global toolsclient ping"
            fi
        }
    }

    define-command ping -params .. %{
        evaluate-commands %sh{
            if [ ${#1} -eq 0 ]; then
                printf "%s" "focus ping"
            else
                printf "%s" "evaluate-commands -client ping %arg{@}"
            fi
        }
    }
    complete-command ping command

    define-command pong -params .. %{
        evaluate-commands %sh{
            if [ ${#1} -eq 0 ]; then
                printf "%s" "focus pong"
            else
                printf "%s" "evaluate-commands -client pong %arg{@}"
            fi
        }
    }
    complete-command pong command
}
