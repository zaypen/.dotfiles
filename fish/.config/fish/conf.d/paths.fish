# Append bin of each virtual env under ~/.venvs

if [ -d $HOME/.venvs ]
  and [ (ls -1d $HOME/.venvs/* | wc -l) -gt 0 ]
  ls -1d $HOME/.venvs/* | while read -l venv
    fish_add_path --append  $venv/bin
  end
end
