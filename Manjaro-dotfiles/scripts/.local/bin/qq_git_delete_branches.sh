#!/bin/bash

function pers_git_delete_branches() {
    # Fetch the latest branches from the remote source
    git fetch --all

    # List and then delete all branches except 'main' and 'X'
	#   `grep -v \*`: excludes the current branch, as it start with a * character. git does not delete the current branch, but will throw an error

	# Implementation using xargs 
    git branch -D $(git branch | grep -v "main" | grep -v \* | grep -v "$1" | xargs)

    # Implemented using a for loop
    #for branch in $(git branch | grep -v "main" | grep -v \* | grep -v "$1"); do
    #    git branch -D "$branch"
    #done

	echo Remaning branches:
    git branch
}
