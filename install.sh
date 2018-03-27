#!/bin/sh

set -e
set -u

BREWFILE_DIR=$GHQ/$USER/Brewfile/
LAUNCHD_DIR=$HOME/Library/LaunchAgents
BACKUP_AGENT=backup-brewfile.plist
BACKUP_AGENT_PATH=$launchd/$BACKUP_AGENT

if [ ! -d "$BREWFILE_DIR" ]; then
	ghq get $USER/Brewfile
fi

if [ ! -d "$LAUNCHD_DIR" ]; then
	mkdir $LAUNCHD_DIR
fi

cp -f $BREWFILE_DIR/$BACKUP_AGENT $BACKUP_AGENT_PATH
launchctl unload $BACKUP_AGENT_PATH
launchctl load $BACKUP_AGENT_PATH
