# Defined in /Users/alexander/.config/fish/config.fish @ line 76
function clangr
	echo $argv[0]
	clang "$argv[0]" && ./a.out && rm a.out;
end
