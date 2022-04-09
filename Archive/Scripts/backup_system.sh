#!/bin/bash

#rsync -a --delete --quiet /mnt/
# -a : indicates that files should be archived, meaning that most of their characteristics are preserved
# --delete : means files deleted on the source are to be deleted on the backup as well
rsync -a --delete /home/ /run/media/ghost1/GHOST0001/backuptest/
