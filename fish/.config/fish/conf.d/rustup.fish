set -x RUSTUP_DIST_SERVER https://mirrors.tuna.tsinghua.edu.cn/rustup
[ -e $HOME/.cargo/bin ] && fish_add_path --append $HOME/.cargo/bin
