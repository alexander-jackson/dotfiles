function gbc
	if count $argv > /dev/null
		git checkout $argv
	else
		git branch | sd "[ \*]" "" | sk | xargs git checkout
	end
end
