# Modified from direnv hook fish >~/.config/fish/conf.d/direnv.fish

function __direnv_export_eval --on-event fish_prompt
	direnv export fish | source
end
