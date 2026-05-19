if [ -e $HOME/.deno ]
   set -x DENO_INSTALL $HOME/.deno
   fish_add_path --append $HOME/.deno/bin
end
