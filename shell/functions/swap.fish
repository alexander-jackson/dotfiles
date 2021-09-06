# Defined in /Users/alexander/.config/fish/config.fish @ line 81
function swap
	cp $argv[1] tempfile
	cp $argv[2] $argv[1]
	cp tempfile $argv[2]
	rm tempfile
end
