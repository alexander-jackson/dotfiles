function summarise-index-bloat
	xsv sort --select "estWastedBytesFf" --numeric --reverse $argv | \
		xsv select "indexName,tableName,indexSizePretty,optimumSizeFfPretty,estWastedBytesFfPretty" | \
		xsv slice --len 15 | \
		xsv table
end
