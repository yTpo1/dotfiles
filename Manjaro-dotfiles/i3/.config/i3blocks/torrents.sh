#!/bin/zsh

# List statistical information from the server
#tsmstats() { transmission-remote -n $TSM_USR_PASS --session-stats ; } 
tsmstats() { transmission-remote --session-stats ; } 

# Result
# Invalid option
# 0.2
#STATS=$(transmission-remote -n $TSM_USR_PASS --session-stats)
#tsm-stats
#$STATS=$(tsmstats)
#echo beforeif
#echo $STATS
#if [ $STATS | grep "Couldn't connect to server" ]; then
#	STATUS="Off"
#else
#	STATUS=$($STATS | awk '/Ratio:/ { print $2 ; exit}')
#fi

# Get CURREST SESSION ratio
#STATUS=$(tsmstats | awk '/Ratio:/ { print $2 ; exit}')

# Get TOTAL ratio
# tsm-stats | awk 'FNR == 12 { print $2 }'

# Get CURREST SESSION Upload
STATUS=$(tsmstats | awk 'FNR == 3 { print $2 ; exit}')

#echo $TSM_USR_PASS

echo Torrent: $STATUS
