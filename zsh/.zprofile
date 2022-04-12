
# Created by `userpath` on 2020-12-26 18:08:03
export PATH="$PATH:/Users/axynos/.local/bin"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"

eval "$(pyenv init -)"  
eval "$(pyenv virtualenv-init -)"
