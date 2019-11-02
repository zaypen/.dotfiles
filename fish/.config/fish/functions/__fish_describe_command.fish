# Temporarily fix slow auto-completion caused by Catalina.
# See https://github.com/fish-shell/fish-shell/issues/6270
function __fish_describe_command; end
