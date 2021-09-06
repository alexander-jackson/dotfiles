# Defined in /var/folders/mt/hhdy2p312bz061ctvbtlgff00000gn/T//fish.GskO6H/ls.fish @ line 2
function ls
	# -G: Coloured output
	# -p: Slashes after directory names
	# -h: Human readable file sizes
	# -A: Include files beginning with a dot, but not . and ..
	# command ls -GphA $argv
	command exa -a $argv
end
