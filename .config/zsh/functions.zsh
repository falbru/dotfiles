ghq_fzf_cd() {
  cd $(ghq root)/$(ghq list | fzf)
}

ghq_get_and_cd() {
  local output=$(ghq get "$1" 2>&1 | tee /dev/tty)

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
  local output=$(ghq create "$1" 2>&1 | tee /dev/tty)

  local ghq_root=$(ghq root | sed 's/[^^]/[&]/g; s/\^/\\^/g')
  local repo_path=$(echo "$output" | grep -o "${ghq_root}[^ \"]*" | tail -n 1)

  if [[ -d "$repo_path" ]]; then
    echo "Changing directory to $repo_path"
    cd "$repo_path"
  else
    echo "Directory not found: $repo_path"
  fi
}

apt_fuzzy_install() {
  pkgs=$(apt-cache search --names-only $1 | awk '{print $1}' | fzf --multi --preview 'apt-cache show {}')
  [ ${#pkgs[@]} -gt 0 ] && sudo apt install $pkgs
}
