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
