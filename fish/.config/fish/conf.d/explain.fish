function __fish_explain -d "Explain current commandline"
    set -l cmd (commandline -b)
    open "https://explainshell.com/explain?cmd=$cmd"
end

bind \ep __fish_explain
