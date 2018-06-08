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
# alias tmux="TERM=xterm-256color tmux"
# alias twig="git branch -vv --sort=-authordate"
alias weather="curl -s wttr.in/Vancouver"
alias md="mdless"
alias dashboard="cdd ~/work/dashboard"
alias assignments="cdd ~/work/assignments"
alias streams="cdd ~/work/streams"

export EDITOR=vim
export FZF_DEFAULT_COMMAND='ag -g ""'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"


__div () {
  printf "\033[2;90m\n$1\n\033[0m"
}

twig () {
  __div "Current Directory"
  printf "  \033[1;35m\033[1;35m$(pwd)\033[0m\n"
  __div "Branches"
  git branch -vv --sort=-authordate --color | awk '{print "  " $0}'
  __div "Status"
  git -c color.ui=always status -sb | awk '{print "  " $0}'
  __div "Diff"
  git diff --stat --color | awk '{print "  " $0}'
  printf "\n"
}

__git_branch () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf "%s " "${b##refs/heads/}";
  fi
}

__prompt () {
  if [[ -n $(git status --porcelain 2>/dev/null) ]]; then
    printf "*> "
  else
    printf "+> "
  fi
}

trap 'echo -ne "\033[0m"' DEBUG

BOLD="\[\e[1m\]"
DIM="\[\e[2m\]"
BLINK="\[\e[5m\]"
RED="\[\e[31m\]"
GREEN="\[\e[32m\]"
BLUE="\[\e[34m\]"
RESET="\[\e[0m\]"

PS_TIME="${DIM}[${RESET}${BOLD}\A${RESET}${DIM}] ${RESET}"
PS_PWD="${BOLD}${BLUE}\W/ ${RESET}"
PS_BRANCH="${BOLD}${RED}\$(__git_branch)${RESET}"
PS_PROMPT="${BOLD}${GREEN}\$(__prompt)${RESET}"
PS_L1="\n${DIM}┌${RESET}"
PS_L2="\n${DIM}│${RESET}"
PS_L3="\n${DIM}└${RESET}"
PS1="${PS_L1}${PS_TIME}${PS_PWD}${PS_BRANCH}${PS_L2}${PS_L3}${PS_PROMPT}"

PATH="$PATH:$HOME/selenium_drivers"
PATH="/usr/local/heroku/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# export PYTHONPATH=$(brew --prefix)/lib/python2.7/site-packages:$PYTHONPATH
export NVM_DIR="$HOME/.nvm"
  . "/usr/local/opt/nvm/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias fe-global="docker exec -it fe-global"
alias tapas="docker exec -it fe-global ./tapas"
alias hs-scripts="docker exec -it hs-scripts"
alias hs-app-inbox="docker exec -it hs-app-inbox"
