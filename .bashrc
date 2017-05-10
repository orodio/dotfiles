# .bashrc

# Source global definitions
# if [ -f /etc/bashrc ]; then
  # . /etc/bashrc
# fi

# [[ -s ~/.twig/twig-completion.bash ]] && source ~/.twig/twig-completion.bash

# http://stackoverflow.com/questions/12399002/how-to-configure-git-bash-command-line-completion
if [ -f ~/dotfiles/.git-completion.bash ]; then
  . ~/dotfiles/.git-completion.bash
fi

# mac bash completion
# https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi

# alias la="ls -aGgh --color"
alias la="ls -aGgh"
alias tmux="TERM=xterm-256color tmux"
# alias twig="git branch -vv --sort=-authordate"
alias weather="curl -s wttr.in/Vancouver"
alias md="mdless"
alias dashboard="cdd ~/work/dashboard"
alias assignments="cdd ~/work/assignments"
alias streams="cdd ~/work/streams"


__div () {
  printf "\033[1;34m\n    *** *** *** *** *** ***\n\n\033[0m"
}

twig () {
  printf "\033[1;35mDIR: \033[1;36m$(pwd)\033[0m\n"
  git status -sb
  git branch -vv --sort=-authordate
}

wat () {
  twig
  git lg --graph --since="12 hours ago"
  __div
}

cdd () {
  __div
  printf "\033[1;35m +> \033[1;36mcd $1\033[0m\n"
  cd $1
  __div
  printf "\033[1;35m +> \033[1;36mgit fetch\033[0m\n"
  git fetch
  wat
}

__git_branch () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf "\e[94m%s \e[0m" "${b##refs/heads/}";
  fi
}

RED=$(tput setaf 1)

__prompt () {
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    printf "*>"
  else
    printf "+>"
  fi
}

trap 'echo -ne "\033[0m"' DEBUG

PS1=" \[\033[1;35m\]\$(__prompt)\[\033[1;36m\] "
PS2=" \[\033[1;35m\] >\[\033[1;36m\] "
# PS1=" \[\033[1;35m\]\$(__prompt)\[\033[0m\] "

# PS1="\$(__line)\n\n \e[31m\]\w \$(__git_branch)\$(__prompt) \[\033[0m\]"

PATH="$PATH:$HOME/selenium_drivers"
PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

# export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
