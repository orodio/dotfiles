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

__git_ps1 () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " %s" "${b##refs/heads/}";
  fi
}

PS1="\[\033[0;35m\]\$(__git_ps1)\[\033[0m\] \[\033[0;33m\]+>\[\033[0m\] "

PATH="$PATH:$HOME/selenium_drivers"
PATH="/usr/local/heroku/bin:$PATH"

chmod +x ~/.vocab
~/.vocab
