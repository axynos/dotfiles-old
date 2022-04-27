# Path to oh-my-zsh installation, not dependent on current user.
export ZSH="$HOME/.oh-my-zsh"

# Profizer for ZSH
# zmodload zsh/zprof

# More themes available at
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

DISABLE_AUTO_TITLE="true"

# Command history timestamp format.
# Comment out to disable history timestamps.
# HIST_STAMPS="dd/mm/yyyy"

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim')

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

# Which plugins should be loaded?
plugins=(
  zsh-nvm
  evalcache
  git
  macos
  zsh-syntax-highlighting
  yarn-completion
)

source $ZSH/oh-my-zsh.sh

# SSH shorthand
alias rpi-local="ssh pi@raspberrypi.local"
alias rpi-remote="ssh pi@90.190.22.45 -p 69"
alias axynos-remote="ssh axynos-remote"

alias cls='clear'

# Cat aliases
alias cat='bat'                   # switch out cat for bat (syntax highlighting in cat)
alias icat='kitty +kitten icat'   # show images in kitty terminal, requires imagemagick

# Fast access to common dotfiles
alias zshconf='nvim ~/.zshrc'
alias vimconf='nvim ~/.vimrc'
alias nvimconf='nvim ~/.config/.nvim'
alias reload='exec zsh'

# QOL
alias start='./start.sh'

# Git specific aliases
alias yoink='git pull'
alias yeet='git push'
alias pull='git pull'
alias push='git push'

# JS/TS specific aliases
alias prisma='yarn prisma'

# Fitbit aliases
alias fitbit='npx fitbit'
alias fitbit-build='npx fitbit-build'

# Add spice to fuckups
alias bljad='fuck'
alias rtfm='man'

alias please='sudo!!'

alias luamake=/Users/axynos/Development/tools/lua-language-server/3rd/luamake/luamake

alias dev='cd ~/Development/'
alias gradlew='./gradlew'

# Faster file browsing.
# Reference: https://youtu.be/eLEo4OQ-cuQ?t=490
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

# Start the ssh agent
# Consider switching to ssh-ident
# https://github.com/ccontavalli/ssh-ident
# ssh-agent -s

# User configuration
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


_evalcache thefuck --alias

eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
# _evalcache jenv init -
eval "$(jenv init -)"

export JAVA_HOME="/opt/homebrew/opt/openjdk@11"


# clear
