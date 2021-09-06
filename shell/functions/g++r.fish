# Defined in /var/folders/mt/hhdy2p312bz061ctvbtlgff00000gn/T//fish.wuDavQ/g++r.fish @ line 2
function g++r
	g++ $argv[1] && ./a.out && rm a.out
end
