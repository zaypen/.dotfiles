complete --command pair --no-files --arguments '(begin; set --local --export COMP_SHELL fish; set --local --export COMP_LINE (commandline); pair complete | sed \'s/ $//\'; end)'
