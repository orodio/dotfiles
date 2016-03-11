# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

alias la="ls -aGgh"

__git_ps1 () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}

PS1="\[\033[0;35m\]\$(__git_ps1)\[\033[0m\] \[\033[0;33m\]\W\[\033[0m\] \$ "

PATH="$PATH:$HOME/selenium_drivers"
