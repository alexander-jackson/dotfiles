function git-stable-status
	set RED "\033[0;31m"
	set GREEN "\033[0;32m"
	set CLEAR "\033[0m"

	# Fetch the latest stable tag
	# git fetch --tags --force origin

	# Get the hash of it
	set STABLE_HASH (git rev-list -n 1 stable)

	# Get the author
	set AUTHOR (git config --get user.name)

	# Get the last 10 commits
	set LOG_LINES (git log --author $AUTHOR origin/master | head -n 10)

	# For each commit, check whether it is after the stable tag
	for line in $LOG_LINES
		set COMMIT_HASH (echo $line | awk '{ print $1 }')
		set WITHOUT_HASH (echo $line | sed "s/$COMMIT_HASH //g")

		if git merge-base --is-ancestor $COMMIT_HASH $STABLE_HASH
			echo -e "$GREEN$WITHOUT_HASH is past the stable tag$CLEAR"
		else
			echo -e "$RED$WITHOUT_HASH is not yet on stable$CLEAR"
		end
	end
end
