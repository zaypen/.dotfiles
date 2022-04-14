set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
[ -e $HOME/.cargo/bin ] && set -x PATH $HOME/.cargo/bin $PATH