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
    REPO="$(basename $(git rev-parse --show-toplevel))"
    ssh "$SSHREMOTE" "git init --bare ~/git-repos/$REPO.git"
    git remote add "$GITREMOTE" "$SSHREMOTE:~/git-repos/$REPO.git"
    git push "$GITREMOTE" --all
    '
# Main Repo:
eval "$CMD"
# Submodules:
git submodule foreach --recursive "$CMD"
