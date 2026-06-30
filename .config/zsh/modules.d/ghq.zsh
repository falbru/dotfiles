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
