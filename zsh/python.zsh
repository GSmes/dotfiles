#!/bin/zsh
if [ -d "$HOME/.pyenv" ]; then
  export PATH="$PATH:$HOME/.pyenv/bin"
  eval "$(command pyenv init --path)"
  eval "$(command pyenv init -)"
fi

function pyenv_prompt_info() {
  if command -v pyenv >/dev/null 2>&1; then
    echo "$(pyenv version-name)"
  fi
}
