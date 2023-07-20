hook -group tilix-hooks global KakBegin .* %sh{
    if [ -n "$TILIX_ID" ] && [ -z "$TMUX" ]; then
        echo "require-module tilix"
    fi
}

provide-module tilix %{

evaluate-commands %sh{
    [ -z "${kak_opt_windowing_modules}" ] || [ -n "$TILIX_ID" ] || echo 'fail Tilix not detected'
}

declare-option -docstring %{window type that tilix creates on new and repl calls (window|session|right|down)} str tilix_window_type down

define-command -hidden -params 2.. tilix-terminal-impl %{
    nop %sh{
        window_type="$1"
        shift
        # join the arguments as one strings for the shell execution (see iterm.kak)
        args=$(
            for i in "$@"; do
                if [ "$i" = '' ]; then
                    printf "'' "
                else
                    printf %s "$i" | sed -e "s|'|'\\\\''|g; s|^|'|; s|$|' |"
                fi
            done
        )
        if [[ ${window_type} == "window" || ${window_type} == "session" ]]; then
            tilix --action app-new-${window_type} --working-directory "$PWD" -e "${args}"
        elif [[ ${window_type} == "right" || ${window_type} == "down" ]]; then
            tilix --action session-add-${window_type} --working-directory "$PWD" -e "${args}"
        else
            tilix --action ${window_type} --working-directory "$PWD" -e "${args}"
        fi
    }
}

define-command tilix-terminal -params 1.. -shell-completion -docstring '
tilix-terminal <program> [<arguments>]: create a new terminal with the default window type
The program passed as argument will be executed in the new terminal
See also: tilix_window_type option' \
%{
    tilix-terminal-impl %opt{tilix_window_type} %arg{@}
}

define-command tilix-terminal-window -params 1.. -command-completion -docstring '
tilix-terminal-window <program> [<arguments>]: create a new terminal in a tilix window
The program passed as argument will be executed in the new terminal' \
%{
    tilix-terminal-impl window %arg{@}
}

define-command tilix-terminal-session -params 1.. -command-completion -docstring '
tilix-terminal-session <program> [<arguments>]: create a new terminal in a new tilix session
The program passed as argument will be executed in the new terminal' \
%{
    tilix-terminal-impl session %arg{@}
}

define-command tilix-terminal-right -params 1.. -command-completion -docstring '
tilix-terminal-right <program> [<arguments>]: create a new terminal in a right split
The program passed as argument will be executed in the new terminal' \
%{
    tilix-terminal-impl right %arg{@}
}

define-command tilix-terminal-down -params 1.. -command-completion -docstring '
tilix-terminal-down <program> [<arguments>]: create a new terminal in a down split
The program passed as argument will be executed in the new terminal' \
%{
    tilix-terminal-impl down %arg{@}
}

define-command tilix-client-new -command-completion -docstring '
tilix-client-new [<arguments>]: create a new kakoune client
See also: tilix_window_type option' \
%{
    tilix-terminal kak -c %val{session}
}

define-command tilix-client-window -command-completion -docstring '
tilix-client-window [<arguments>]: create a new kakoune client in a new window' \
%{
    tilix-terminal-window kak -c %val{session}
}

define-command tilix-client-session -command-completion -docstring '
tilix-client-session [<arguments>]: create a new kakoune client in a new session' \
%{
    tilix-terminal-session kak -c %val{session}
}

define-command tilix-client-right -command-completion -docstring '
tilix-client-right [<arguments>]: create a new kakoune client in a right split' \
%{
    tilix-terminal-right kak -c %val{session}
}

define-command tilix-client-down -command-completion -docstring '
tilix-client-down [<arguments>]: create a new kakoune client in a down split' \
%{
    tilix-terminal-down kak -c %val{session}
}

alias global terminal tilix-terminal
alias global terminal-right tilix-terminal-right
alias global terminal-down tilix-terminal-down
alias global new-window tilix-client-window
alias global new-session tilix-client-session
alias global new-right tilix-client-right
alias global new-down tilix-client-down

}
