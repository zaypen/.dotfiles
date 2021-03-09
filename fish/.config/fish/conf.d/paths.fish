# Append bin of each virtual env under ~/.venvs
ls -1d $HOME/.venvs/* | while read -l venv
    set -x PATH $PATH $HOME/.venvs/$venv/bin
end
