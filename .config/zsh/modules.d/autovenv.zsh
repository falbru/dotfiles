autoload -U add-zsh-hook
load_venv() {
    if [[ -d ".venv" && -f ".venv/bin/activate" ]]; then
        source ".venv/bin/activate"
    fi
    if [[ -d "venv" && -f "venv/bin/activate" ]]; then
        source "venv/bin/activate"
    fi
}
add-zsh-hook chpwd load_venv
load_venv
