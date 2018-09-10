```
git clone https://github.com/orodio/dotfiles $HOME/dotfiles

https://medium.com/@dubistkomisch/how-to-actually-get-italics-and-true-colour-to-work-in-iterm-tmux-vim-9ebe55ebc2be
tic -x xterm-256color-italic.terminfo

// https://github.com/ryanoasis/nerd-fonts - fura code not fira
brew tap caskroom/fonts
brew cask install font-firacode-nerd-font-mono 
brew install fzf ag ack diff-so-fancy ctags
$(brew --prefix)/opt/fzf/install

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.bash_profile $HOME/.bash_profile

mkdir $HOME/.vim/colors
ln -s $HOME/dotfiles/orodio.vim $HOME/.vim/colors/orodio.vim

git clone https://github.com/orodio/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
