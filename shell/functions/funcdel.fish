# Defined in /var/folders/mt/hhdy2p312bz061ctvbtlgff00000gn/T//fish.IUSQiA/funcdel.fish @ line 2
function funcdel
	if test -e ~/.config/fish/functions/$argv[0].fish
        rm ~/.config/fish/functions/$argv[0].fish
        echo 'Deleted function ' $argv[0]
    else
        echo 'Not found function ' $argv[0]
    end
end
