```
git clone https://github.com/orodio/dotfiles $HOME/dotfiles

ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

git clone https://github.com/orodio/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
```
