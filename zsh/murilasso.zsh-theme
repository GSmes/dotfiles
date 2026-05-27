local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"
local user_host='%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}'
local current_dir='%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%}'
local ruby_version='%{$fg[red]%}$(rbenv_prompt_info)%{$reset_color%}'
local python_version='%{$fg[red]%}$(pyenv_prompt_info)%{$reset_color%}'
local git_branch='%{$fg[blue]%}$(git_prompt_info)%{$reset_color%}'

PROMPT="%{$terminfo[bold]$fg[green]%}%n@%m%{$reset_color%}:%{$terminfo[bold]$fg[blue]%}%~%{$reset_color%} %{$fg[red]%}(Ruby: $(rbenv version-name)) (Python: $(pyenv version-name))%{$reset_color%}
%{$fg[blue]%}$(git_prompt_info)%{$reset_color%} %B$%b "

PROMPT="${user_host}:${current_dir} (Ruby: ${ruby_version}) (Python: ${python_version})
${git_branch} %B$%b "
RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
