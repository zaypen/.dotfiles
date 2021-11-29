# Append bin of each virtual env under ~/.venvs

if [ -d $HOME/.venvs ]
  if [ (ls -1d $HOME/.venvs/* | wc -l) -gt 0 ]
    ls -1d $HOME/.venvs/* | while read -l venv
      set -x PATH $PATH $venv/bin
    end
  end
end