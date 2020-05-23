# Simple theme based on my old zsh settings.

# settings
typeset +H _current_dir="%{$fg_bold[blue]%}%3~%{$reset_color%} "

function _user_host() {
  local me
  me="%n@%m"
  if [[ -n $SSH_CONNECTION ]]; then
    me="%n@%m"
  elif [[ $LOGNAME != $USER ]]; then
    me="%n"
  fi
  if [[ -n $me ]]; then
    echo "%{$fg[cyan]%}$me%{$reset_color%}:"
  fi
}

function get_host {
	echo '@'$HOST
}

PROMPT='$(_user_host)${_current_dir} 
%{%(!.%F{red}.%F{white})%}▶%{$resetcolor%} '

PROMPT2='%{%(!.%F{red}.%F{white})%}◀%{$reset_color%} '

RPROMPT='$(vi_mode_prompt_info)%{$(echotc UP 1)%}$(git_prompt_info) $(git_prompt_status) ${_return_status}%{$(echotc DO 1)%}'

#PROMPT='> '
#RPROMPT='%~$(git_prompt_info)$(get_host)'

# Git prompt settings
ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✚ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚑ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}✖ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}▴ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[cyan]%}§ %{$reset_color%}"
