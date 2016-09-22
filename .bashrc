# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

[[ -s ~/.twig/twig-completion.bash ]] && source ~/.twig/twig-completion.bash

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias la="ls -aGgh"
alias tmux="TERM=xterm-256color tmux"

# colors in man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

__git_branch () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf "\e[94m%s \e[0m" "${b##refs/heads/}";
  fi
}

__prompt () {
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    printf "\e[33m*>"
  else
    printf "\e[33m+>"
  fi
}

__line () {
  printf '\n\e[2;90m%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
}

PS1="\$(__line)\n\n \e[31m\w \$(__git_branch)\$(__prompt) \[\033[0m\]"

PATH="$PATH:$HOME/selenium_drivers"
PATH="/usr/local/heroku/bin:$PATH"


# chmod d+x ~/.vocab
# ~/.vocab
