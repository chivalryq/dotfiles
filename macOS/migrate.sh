#!bin/bash
# excuting script repeatedly should be safe
DOTFILEDIR=~/repo/dotfiles
REPODIR=~/repo

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
rm ~/.vimrc
rm ~/.zshrc
ln -sF $DOTFILEDIR/.vimrc ~/.vimrc
ln -sF $DOTFILEDIR/.zshrc ~/.zshrc
ln -sF $DOTFILEDIR/.tmux.conf ~/.tmux.conf
cp .ideavimrc ~

#proxy
echo "Please set proxy software, I'm gonna use 127.0.0.1:7890 as proxy"
export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890

#brew
brew install fortune
brew install cowsay
brew install bat
brew install fzf
brew install zsh-syntax-highlighting
brew install jesseduffield/lazygit/lazygit
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
brew install iterm2


$(brew --prefix)/opt/fzf/install

 

#install omz and plugin
config_zsh(){
        echo "正在配置 zsh..."
        rm -rf $HOME/.oh-my-zsh
        wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
        git clone https://github.com/wting/autojump.git $REPODIR/autojump
        pushd $REPODIR/autojump
        ./install.py
        popd
        #Powerlevel10k
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
}

#vim
config_vim(){
        echo "正在配置 vim..."
        git clone https://github.com/joshdick/onedark.vim.git $REPODIR/onedark
        pushd $REPODIR/onedark
        mkdir ~/.vim/colors
        cp colors/onedark.vim ~/.vim/colors/
        cp autoload/onedark.vim ~/.vim/autoload/
        echo "Remember to import onedark color scheme (onedark/term/One Dark.itermscheme)in iTerm."
        echo "Remember to set font to font-jetbrains-mono-nerd-font in iTerm"
}

config_tmux(){
        echo "正在配置 tmux..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        bash ~/.tmux/plugins/tpm/bin/install_plugins
}

config_lazygit(){
        echo "正在配置 lazygit..."
        mkdir -p ~/Library/Application\ Support/jesseduffield/lazygit
        ln -sF $DOTFILEDIR/config/lazygit/config.yml ~/Library/Application\ Support/jesseduffield/lazygit/config.yml
        
}
config_zsh
config_vim
config_tmux
config_lazygit
