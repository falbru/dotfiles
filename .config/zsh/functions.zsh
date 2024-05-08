function ghq_fzf_cd {
  cd $(ghq root)/$(ghq list | fzf)
}

function ghq_get_and_cd() {
  local output=$(ghq get "$1" 2>&1 | tee /dev/tty)

  local ghq_root=$(ghq root | sed 's/[^^]/[&]/g; s/\^/\\^/g')  # Escape regex characters
  local repo_path=$(echo "$output" | grep -o "${ghq_root}[^ ]*" | head -n 1)

  if [[ -d "$repo_path" ]]; then
    echo "Changing directory to $repo_path"
    cd "$repo_path"
  else
    echo "Directory not found: $repo_path"
  fi
}
