# Disable "flow control"
setopt noflowcontrol


# Configure History
setopt append_history
setopt hist_expire_dups_first
setopt hist_fcntl_lock
setopt hist_ignore_all_dups
setopt hist_lex_words
setopt hist_reduce_blanks
setopt hist_save_no_dups
#setopt share_history
setopt HIST_IGNORE_SPACE
export BLOCK_SIZE=human-readable # https://www.gnu.org/software/coreutils/manual/html_node/Block-size.html
export HISTSIZE=11000
export SAVEHIST=10000
export HISTFILE=~/.zsh_history
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# completion
# Ensure zsh's stock functions dir (where compinit lives) is on fpath.
# Homebrew installs compinit under share/zsh/functions, not the Cellar path.
fpath=(/opt/homebrew/share/zsh/functions $fpath)
autoload -Uz compinit
typeset -i updated_at=$(date +'%j' -r ~/.zcompdump 2>/dev/null || stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null)
if [ $(date +'%j') != $updated_at ]; then
  compinit
else
  compinit -C
fi

export EDITOR='code'

# enable colored output from ls, etc
export CLICOLOR=1

# Lazy load nvm on first use (not exported, so it doesn't leak into child
# shells where the zsh-nvm plugin isn't loaded — e.g. VS Code task shells)
NVM_LAZY_LOAD=true
# NVM auto use
NVM_AUTO_USE=true

# Fallback so zsh-nvm's lazy/auto-use hooks don't error with
# "command not found: _zsh_nvm_load" if the plugin hasn't loaded yet
if ! typeset -f _zsh_nvm_load >/dev/null 2>&1; then
  _zsh_nvm_load() { :; }
fi

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ -f ~/.zshrc.private ]] && source ~/.zshrc.private

source ~/.zplugrc

# Aliases
[[ -f ~/.aliases ]] && source ~/.aliases
eval "$(pyenv init -)"
export PATH="/opt/homebrew/opt/postgresql@18/bin:$PATH"
