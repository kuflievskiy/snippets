#!/bin/sh

# Author : Kuflievskiy Aleksey <kuflievskiy@gmail.com>
# based on http://stackoverflow.com/questions/3462955/putting-git-hooks-into-repository/3464399#3464399
# How to use : bash git/install-hooks.sh

#HOOK_NAMES="applypatch-msg pre-applypatch post-applypatch pre-commit prepare-commit-msg commit-msg post-commit pre-rebase post-checkout post-merge pre-receive update post-receive post-update pre-auto-gc pre-push"
HOOK_NAMES="pre-commit commit-msg"
# assuming the script is in a bin directory, one level into the repo
HOOK_DIR=$(git rev-parse --show-toplevel)/.git/hooks

for hook in $HOOK_NAMES; do
    # If the hook already exists, is a file, and is not a symlink
    if [ ! -h $HOOK_DIR/$hook -a -f $HOOK_DIR/$hook ]; then
        mv $HOOK_DIR/$hook $HOOK_DIR/$hook.local
    fi
    # create the symlink, overwriting the file if it exists
    # probably the only way this would happen is if you're using an old version of git
    # -- back when the sample hooks were not executable, instead of being named ____.sample
    ln -s -f ../../git/hooks/$hook $HOOK_DIR/$hook
	chmod 755 ./git/hooks/$hook
done