_j_dirs() {
  local ghq_repos=$(ghq list -p)
  local extra_dirs=(
    '/home/falk/.config/kak/'
    '/home/falk/.config/zsh/'
  )

  printf '%s\n' "${ghq_repos[@]}" "${extra_dirs[@]}"
}

j() {
  local jump_path=$(_j_dirs | grep -i "${1:-.*}"  | sed "s|^$HOME/||" | fzf)
  [ -z "$jump_path" ] || { cd "$HOME/$jump_path" && clear }
}

ghq_get_and_cd() {
  local output=$(command ghq get "$@" 2>&1 | tee /dev/tty)
  local ghq_root=$(ghq root | sed 's/[^^]/[&]/g; s/\^/\\^/g')
  local repo_path=$(echo "$output" | grep -o "${ghq_root}[^ ]*" | head -n 1)
  if [[ -d "$repo_path" ]]; then
    echo "Changing directory to $repo_path"
    cd "$repo_path"
  else
    echo "Directory not found: $repo_path"
  fi
}

ghq_create_and_cd() {
  local output=$(command ghq create "$@" 2>&1 | tee /dev/tty)
  local ghq_root=$(ghq root | sed 's/[^^]/[&]/g; s/\^/\\^/g')
  local repo_path=$(echo "$output" | grep -o "${ghq_root}[^ \"]*" | tail -n 1)
  if [[ -d "$repo_path" ]]; then
    echo "Changing directory to $repo_path"
    cd "$repo_path"
  else
    echo "Directory not found: $repo_path"
  fi
}

function ghq() {
  local command="$1"

  case "$command" in
    get)
      shift
      ghq_get_and_cd "$@"
      ;;
    create)
      shift
      ghq_create_and_cd "$@"
      ;;
    *)
      command ghq "$@"
      ;;
  esac
}

apt_fuzzy_install() {
  local pkgs=$(apt-cache search --names-only $1 | awk '{print $1}' | fzf --multi --preview 'apt-cache show {}')
  [ ${#pkgs[@]} -gt 0 ] && sudo apt install $pkgs
}

function fzf_alias() {
    local selection
    if selection=$(alias |
                       sed 's/=/\t/' |
                       column -s '	' -t |
                       fzf --query="$BUFFER" |
                       awk '{ print $1 }'); then
        BUFFER=$selection
        CURSOR=$#BUFFER
    fi
    zle redisplay
}

zle -N fzf_alias
bindkey -M emacs '\ea' fzf_alias
bindkey -M vicmd '\ea' fzf_alias
bindkey -M viins '\ea' fzf_alias
