#!/bin/sh

wait_for_session() {
    session=$1
    while ! kak -l | grep -q -F -x "$session"; do
        sleep 0.1
    done
}

launch_kak_qt() {
    (kak-qt "$@" >/dev/null 2>&1 &)
}

kak -clear

if [ "$(git rev-parse --show-toplevel 2> /dev/null)" ]; then
    git_dir=$(basename "$(git rev-parse --show-toplevel | tr -d '.')")

    if ! kak -l | grep -E "^$git_dir\$"; then
        setsid kak -d -s "$git_dir" &
        wait_for_session "$git_dir"
    fi

    launch_kak_qt -c "$git_dir" "$@"
else
    launch_kak_qt -c "default" "$@"
fi
