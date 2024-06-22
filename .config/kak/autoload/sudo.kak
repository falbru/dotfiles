define-command sudo-write %{
    write -force "/tmp/kak_sudo"
    evaluate-commands %sh{
        password=$(echo -e "SETPROMPT Please enter your sudo password:\nGETPIN\n" | \
                   pinentry | \
                   sed -nr '0,/^D (.+)/s//\1/p')
        echo "$password" | sudo -S sh -c "cat /tmp/kak_sudo > '$kak_buffile'"
        rm "/tmp/kak_sudo"
    }
}
