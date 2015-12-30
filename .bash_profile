export NVM_DIR=~/.nvm
if [ -f $(brew --prefix nvm)/nvm.sh ]; then
  . $(brew --prefix nvm)/nvm.sh
fi

eval "$(hub alias -s)"

alias la="ls -aGgh"
alias serve="python -m SimpleHTTPServer"
alias bc="cd ~/work/bullclip_web"

if [ -f $HOME/dotfiles/git-completion.bash ]; then
  source $HOME/dotfiles/git-completion.bash
fi

if [ -f $HOME/dotfiles/hub-completion ]; then
  . $HOME/dotfiles/hub-completion
fi

__git_ps1 () {
  local b="$(git symbolic-ref HEAD 2>/dev/null)";
  if [ -n "$b" ]; then
    printf " (%s)" "${b##refs/heads/}";
  fi
}

PS1="\[\033[0;35m\]\$(__git_ps1)\[\033[0m\] \[\033[0;33m\]\W\[\033[0m\] \$ "
