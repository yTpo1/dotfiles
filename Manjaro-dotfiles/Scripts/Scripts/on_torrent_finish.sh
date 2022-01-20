#!/bin/bash

# Supported environment variables:
# * TR_APP_VERSION
# * TR_TIME_LOCALTIME
# * TR_TORRENT_DIR
# * TR_TORRENT_HASH
# * TR_TORRENT_ID
# * TR_TORRENT_NAME

$TR_TORRENT_NAME="torr done"

notify-send $TR_TORRENT_NAME
