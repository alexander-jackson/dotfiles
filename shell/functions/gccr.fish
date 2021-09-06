# Defined in /var/folders/mt/hhdy2p312bz061ctvbtlgff00000gn/T//fish.1egrDZ/gccr.fish @ line 2
function gccr
	gcc $argv[1] && ./a.out && rm a.out;
end
