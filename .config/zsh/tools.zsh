# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# pnpm
export PNPM_HOME="/home/falk/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# bun
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
