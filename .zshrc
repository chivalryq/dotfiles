# export PATH=$HOME/bin:/usr/local/bin:$PATH
ZSH_TMUX_AUTOSTART_ONCE=true

# Path to your oh-my-zsh installation.
export ZSH="/Users/qiaozp/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="eastwood-qzp"


# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails oo many plugins slow dgit textmate ruby lighthouse)
# Add wisely, as town shell startup.
plugins=(git zsh-autosuggestions vi-mode zsh-syntax-highlighting autojump kubectl fzf)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

export PATH=$PATH:/Users/qiaozp/go/bin
export PATH=/usr/local/bin:$PATH

setalias(){
        #k8s
        alias k=kubectl
        alias kg="k get"
        alias kd="k describe"
        alias kc="k config"
        alias kde="k delete"
				alias kga="k get app"
				alias kgaA="k get app -A"

				alias nok="export KUBECONFIG="
				#alias lk="export KUBECONFIG=$(velad kubeconfig --host)"
				alias ek='echo $KUBECONFIG'
				alias kva="kubectl-view-allocations"


        alias lg='lazygit'
        # proxy and noproxy
        if [ "$(uname)"=="Darwin" ]; then
                #export https_proxy=http://127.0.0.1:7890 http_proxy=http://127.0.0.1:7890 all_proxy=socks5://127.0.0.1:7890
        fi
        alias nop='echo "canceling proxy" && export https_proxy= http_proxy= all_proxy='
        alias nops='export https_proxy= http_proxy= all_proxy='
        alias setproxy='export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153'

        # terraform
        # autoload -U +X bashcompinit && bashcompinit
        # complete -o nospace -C /usr/local/bin/terraform terraform
        alias t='terraform'

        #ranger
        alias ra='ranger'

        #quick source .zshrc
        alias sz="source ~/.zshrc"

        #CLI tools
        alias cat='bat'

        #kubevela tools
				if [ -f $HOME'/repo/vela-script/alias.sh' ]; then
					source $HOME'/repo/vela-script/alias.sh'
				fi

        # edit file short cut
        alias vim='nvim'
				alias vs='vim ~/.ssh/config'
				alias vh="vim /etc/hosts"
				alias vk='vim ~/.kube'

				alias 9="k9s"
				alias kk="k9s"
				alias kva="kubectl view-allocations"


		alias nv='nvim'
		alias python=python3
		alias s=ssh
}

setgvm(){
  [[ -s "/Users/qiaozp/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
	gvm use go1.21 > /dev/null
}
setalias
setproxy
setgvm

# export GOPROXY=https://goproxy.io,direct

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# fortune | cowsay

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"


eval $(thefuck --alias)
export GOPATH="$HOME/go"
export GOBIN="$HOME/go/bin"
export PATH="/usr/local/opt/node@14/bin:$HOME/go/bin:$PATH"

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh
source ~/repo/dotfiles/kubeconfig-key-binding.zsh
source ~/repo/dotfiles/k9s-key-binding.zsh

[[ -s "/Users/qiaozp/.gvm/scripts/gvm" ]] && source "/Users/qiaozp/.gvm/scripts/gvm"
