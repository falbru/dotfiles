export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

[ -s "/home/falk/.bun/_bun" ] && source "/home/falk/.bun/_bun"

# autovenv
autoload -U add-zsh-hook
load_venv() {
    if [[ -d "venv" && -f "venv/bin/activate" ]]; then
        source "venv/bin/activate"
    fi
}
add-zsh-hook chpwd load_venv
load_venv
