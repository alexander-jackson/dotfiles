# Defined in /var/folders/mt/hhdy2p312bz061ctvbtlgff00000gn/T//fish.64iFkv/fish_prompt.fish @ line 2
function fish_prompt --description 'Write out the prompt'
	set -l color_cwd
	set -l suffix
	switch "$USER"
		case root toor
			if set -q fish_color_cwd_root
				set color_cwd $fish_color_cwd_root
			else
				set color_cwd $fish_color_cwd
			end
			set suffix '#'
		case '*'
			set color_cwd $fish_color_cwd
			set suffix '>'
	end

	echo -n -s "$USER" @ (prompt_hostname) ' ' (set_color $color_cwd) (prompt_pwd) (set_color normal) "$suffix "
end