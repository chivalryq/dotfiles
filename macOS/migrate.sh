#!bin/bash
# excuting script repeatedly should be safe
DOTFILEDIR=~/repo/dotfiles
REPODIR=~/repo
CONFIGDIR=~/.config

# make sure CONFIGDIR is created
mkdir -p $CONFIGDIR

rm ~/.zshrc
ln -sF $DOTFILEDIR/.zshrc ~/.zshrc
ln -sF $DOTFILEDIR/.tmux.conf ~/.tmux.conf
ln -sF $DOTFILEDIR/.yabairc ~/.yabairc
ln -sF $DOTFILEDIR/.skhdrc ~/.skhdrc
cp .ideavimrc ~

#proxy
echo "Please set proxy software, I'm gonna use 127.0.0.1:6153 (Surge) as proxy"
# export https_proxy=http://127.0.0.1:13659 http_proxy=http://127.0.0.1:13659 all_proxy=socks5://127.0.0.1:13659
# export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153

#brew
brew install wget
brew install fortune
brew install cowsay
brew install bat
brew install fzf
brew install zsh-syntax-highlighting
brew install jesseduffield/lazygit/lazygit
brew tap homebrew/cask-fonts
brew install font-jetbrains-mono-nerd-font
brew install iterm2
brew install alt-tab # migrate from win, make it possible to check out windows.
brew install neovim
brew install node
brew install tmux
brew install --cask alt-tab
brew install --cask gitify
brew install autojump
brew install k9s
brew install koekeishiya/formulae/yabai
brew install koekeishiya/formulae/skhd
brew tap FelixKratz/formulae
brew install sketchybar
brew services start skhd



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

#neovim
config_neovim(){
        echo "正在配置 neovim..."
        ln -sF $DOTFILEDIR/config/nvim $CONFIGDIR
        echo "Remember to set font to font-jetbrains-mono-nerd-font in iTerm"
}


config_tmux(){
        echo "正在配置 tmux..."
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        bash ~/.tmux/plugins/tpm/bin/install_plugins
}

config_lazygit(){
        echo "正在配置 lazygit..."
        mkdir -p ~/Library/Application\ Support/lazygit
        ln -sF $DOTFILEDIR/config/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml
}
config_zsh
config_neovim
config_tmux
config_lazygit
