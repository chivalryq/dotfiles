curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#TODO split .vimrc in Win and *nix
rm ~/.vimrc
rm ~/.zshrc
rm ~/.ideavimrc
ln -s ~/repo/dotfiles/.vimrc ~/.vimrc
ln -s ~/repo/dotfiles/.ideavimrc ~/.ideavimrc
ln -s ~/repo/dotfiles/.zshrc ~/.zshrc
