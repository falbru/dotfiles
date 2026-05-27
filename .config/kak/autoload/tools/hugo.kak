define-command -docstring 'hugo [command]: Hugo wrapper
Available commands
    build   - Build your site
    new     - Create new content
    server  - Start the embedded web server
' -params 1.. hugo %{
    evaluate-commands %sh{
        cmd="$1"
        shift
        case "$cmd" in
            build)
                if out=$(hugo build 2>&1); then
                    pages=$(echo "$out" | grep -oP 'Pages\s+│\s+\K\d+')
                    static=$(echo "$out" | grep -oP 'Static files\s+│\s+\K\d+')
                    total=$(echo "$out" | grep -oP 'Total in \K[0-9]+ ms')
                    echo "echo Built $pages pages, $static static files in $total"
                else
                    printf "fail %s\n" "$(echo "$out" | grep ERROR)"
                fi
                ;;
            new)
                if [ "$1" = "content" ]; then
                    shift
                    if out=$(hugo new content "$@" 2>&1); then
                        filepath=$(echo "$out" | grep -oP 'Content "\K[^"]+')
                        printf "edit -existing %s\n" "$filepath"
                    else
                        printf "fail %s\n" "$(echo "$out" | grep ERROR)"
                    fi
                else
                    echo "fail 'Error: only new content is supported'"
                fi
                ;;
            server|serve)
                echo "fifo -name *hugo* -scroll hugo server $@"
                ;;
            *)
                echo "fail Unknown Hugo command"
                ;;
        esac
    }
}
