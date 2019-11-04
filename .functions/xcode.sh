# modified from https://github.com/rkalis/dotfiles
installXcode() {
    info "Installing XCode command line tools..."
    if xcode-select --print-path &>/dev/null; then
        info "XCode command line tools already installed."
    elif xcode-select --install &>/dev/null; then
        info "Finished installing XCode command line tools."
    else
        error "Failed to install XCode command line tools."
    fi
}
