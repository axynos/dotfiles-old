export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$PATH:/Users/axynos/.local/bin"
export PATH="/usr/local/opt/libpq/bin:$PATH"
export PATH="$HOME/Development/tools/cli:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/tcl-tk/lib/pkgconfig"
export PATH="$PATH:/Users/axynos/.local/bin"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/opt/bzip2/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/zlib/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include"


eval "$(/opt/homebrew/bin/brew shellenv)"
export PYTHON_CONFIGURE_OPTS="--with-tcltk-includes='-I$(brew --prefix tcl-tk)/include' \
                              --with-tcltk-libs='-L$(brew --prefix tcl-tk)/lib -ltcl8.6 -ltk8.6'"
