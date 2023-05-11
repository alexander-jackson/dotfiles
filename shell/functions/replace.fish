function replace
	rg -l $1 | xargs sd -s $1 $2
end
