# modified from https://github.com/rkalis/dotfiles
obtainAccess() {
    if sudo -v; then
        # Keep-alive: update existing `sudo` time stamp until `setup.sh` has finished
        while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &
        info "Sudo credentials updated."
    else
        error "Failed to obtain sudo credentials."
    fi
}