function gbd
	git branch | sd "[ \*]" "" | sk | xargs git branch -d
end
