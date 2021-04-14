# Path to oh-my-zsh installation.
export ZSH="/Users/axynos/.oh-my-zsh"

# More themes available at
# https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

	# Command history timestamp format.
# Comment out to disable history timestamps.
HIST_STAMPS="dd/mm/yyyy"

# Which plugins should be loaded?
plugins=(
  git
  zsh-syntax-highlighting
  yarn-completion
)

source $ZSH/oh-my-zsh.sh

# User configuration
# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/usr/local/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/tcl-tk/lib"
export CPPFLAGS="-I/usr/local/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I$(brew --prefix tcl-tk)/include' \
                              --with-tcltk-libs='-L$(brew --prefix tcl-tk)/lib -ltcl8.6 -ltk8.6'"
eval "$(pyenv init -)"

# Aliases
alias fitbit='npx fitbit'
alias fitbit-build='npx fitbit-build'

alias oopdb-root="ssh root@178.128.248.36"
alias oopdb="ssh oopdb@178.128.248.36"

alias rpi-local="ssh pi@raspberrypi.local"
alias rpi-remote="ssh pi@80.235.121.44 -p 69"

alias discover-network="(ping 192.168.1.255 -c 10) > /dev/null; echo 'Broadcast to network complete.'"

alias cls='clear'
alias cl='clear'

# Override cat with syntax highlighting.
alias cat='bat'

# Fast access to common dotfiles
alias zshconf='vim ~/.zshrc'
alias vimconf='vim ~/.vimrc'

# Initialize 'fuck' command and add a touch of slavness.
eval $(thefuck --alias)
alias bljad='fuck'

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

# Update PATH for the Google Cloud SDK.
if [ -f '/Users/axynos/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/axynos/google-cloud-sdk/path.zsh.inc'; fi

# Enable shell command completion for gcloud.
if [ -f '/Users/axynos/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/axynos/google-cloud-sdk/completion.zsh.inc'; fi

# Jenv init
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# Created by `userpath` on 2020-12-26 18:08:03
export PATH="$PATH:/Users/axynos/.local/bin"
export PATH="/usr/local/opt/libpq/bin:$PATH"

# Start the ssh agent
ssh-agent -s
cl
