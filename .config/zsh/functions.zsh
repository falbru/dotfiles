ghq_fzf_cd() {
  local repo_path=$(ghq list | grep "${1:-.*}" | fzf)
  [ -z "$repo_path" ] || cd "$(ghq root)/$repo_path"
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
  local pkgs=$(apt-cache search --names-only $1 | awk '{print $1}' | fzf --multi --preview 'apt-cache show {}')
  [ ${#pkgs[@]} -gt 0 ] && sudo apt install $pkgs
}

gh_open_pr_in_browser() {
  local current_branch="$1"
  [ -z "$current_branch" ] && current_branch=$(git rev-parse --abbrev-ref HEAD)
  local pr_url=$(gh pr view "$current_branch" --json url | jq -r '.url')
  xdg-open "$pr_url" >/dev/null 2>&1
}
_git 2>/dev/null
compdef __git_branch_names gh_open_pr_in_browser
