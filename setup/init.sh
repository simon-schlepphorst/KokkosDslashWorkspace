#!/usr/bin/env bash

# Sanity Checks
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 Git_Remote SSH_Alias"
	exit 1
fi
if ! ssh -q "$2" exit; then
	echo SSH Connection to "$2" failed.
	exit 1
fi

export GITREMOTE="$1"
export SSHREMOTE="$2"

# Commands to run:
CMD='
    USER="$(git config --get remote.origin.url | sed -n "s/.*[:\/]\(\S*\)\/.*$/\1/p")"
    REPO="$(git config --get remote.origin.url | sed -n "s/.*\/\(\S*\)$/\1/p")"
    ssh "$SSHREMOTE" "git init --bare ~/git-repos/$USER/$REPO"
    git remote add "$GITREMOTE" "$SSHREMOTE:~/git-repos/$USER/$REPO"
    git push "$GITREMOTE" --all
    '
# Main Repo:
eval "$CMD"
# Submodules:
git submodule foreach --recursive "$CMD"
