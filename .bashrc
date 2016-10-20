# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

[[ -s ~/.twig/twig-completion.bash ]] && source ~/.twig/twig-completion.bash

# http://stackoverflow.com/questions/12399002/how-to-configure-git-bash-command-line-completion
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias la="ls -aGgh"
alias tmux="TERM=xterm-256color tmux"
alias twig="git branch -vv"
# alias cdd="cd ~/work/bullclip.web; git fetch; twig;"

cdd () {
  printf "\n*** *** *** *** *** ***\n\n"
  printf "+> ~/work/bullclip.web\n"
  cd ~/work/bullclip.web
  printf "\n*** *** *** *** *** ***\n\n"
  printf "+> get fetch\n"
  git fetch
  printf "\n*** *** *** *** *** ***\n\n"
  git status
  printf "\n*** *** *** *** *** ***\n\n"
  twig
  printf "\n*** *** *** *** *** ***\n\n"
  git lg --graph --grep="Merge pull request" --invert-grep --since="7 days ago"
  printf "\n*** *** *** *** *** ***\n\n"
}

__git_branch () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf "\e[94m%s \e[0m" "${b##refs/heads/}";
  fi
}

__prompt () {
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    printf "∵"
  else
    printf "∴"
  fi
}

PS1=" \[\033[1;31m\]\$(__prompt)\[\033[0m\] "

# PS1="\$(__line)\n\n \e[31m\]\w \$(__git_branch)\$(__prompt) \[\033[0m\]"

PATH="$PATH:$HOME/selenium_drivers"
PATH="/usr/local/heroku/bin:$PATH"
