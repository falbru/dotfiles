alias \
    aptfi='apt_fuzzy_install' \
    aptrm='sudo apt remove' \
    aptupg='sudo apt update && sudo apt upgrade && sudo apt autoremove'

apt_fuzzy_install() {
  local pkgs=$(apt-cache search --names-only $1 | awk '{print $1}' | fzf --multi --preview 'apt-cache show {}')
  [ ${#pkgs[@]} -gt 0 ] && sudo apt install $pkgs
}
