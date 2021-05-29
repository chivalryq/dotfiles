#!bin/bash
DOTFILEDIR=~/repo/dotfiles
REPODIR=~/repo

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm ~/.vimrc
rm ~/.zshrc
ln -sF $DOTFILEDIR/.vimrc ~/.vimrc
ln -sF $DOTFILEDIR/.zshrc ~/.zshrc
cp .ideavimrc ~

#proxy
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

#brew
brew install fortune
brew install cowsay
brew install zsh-syntax-highlighting
brew install jesseduffield/lazygit/lazygit


#install omz and plugin
rm -rf $HOME/.oh-my-zsh
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/wting/autojump.git $REPODIR/autojump
cd $REPODIR/autojump
./install.py
