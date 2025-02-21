#!/bin/bash

#NEW_FILE_NAME=$(echo $1 | awk -F'[_.]' '{print $4}')

NEW_FILE_NAME=${1%.*}_new.m3u

#printf "%s" "$(<$1)" >> $NEW_FILE_NAME
FILE_CONTENTS=$(printf "%s" "$(<$1)")
#echo $FILE_CONTENTS

#echo $(printf $FILE_CONTENTS) >> $NEW_FILE_NAME

# Paste old playlist into new file
cat $1 > $NEW_FILE_NAME

#printf $1 >> $NEW_FILE_NAME

# Replace the incorrect encoding
sed -i -- 's/%20/ /g' $NEW_FILE_NAME
sed -i -- 's/%2C/,/g' $NEW_FILE_NAME
sed -i -- 's/%3B/;/g' $NEW_FILE_NAME
#
sed -i -- 's/%26/\&/g' $NEW_FILE_NAME
sed -i -- "s/%27/'/g" $NEW_FILE_NAME
sed -i -- 's/%28/(/g' $NEW_FILE_NAME
sed -i -- 's/%29/)/g' $NEW_FILE_NAME
#
sed -i -- 's/%E2%80%93/–/g' $NEW_FILE_NAME
#
sed -i -- 's/%E2%80%99/’/g' $NEW_FILE_NAME
sed -i -- 's/%C3%A0/à/g' $NEW_FILE_NAME
sed -i -- 's/%C3%A9/é/g' $NEW_FILE_NAME
sed -i -- 's/%C3%A8/è/g' $NEW_FILE_NAME
sed -i -- 's/%C3%89/É/g' $NEW_FILE_NAME
sed -i -- 's/%C3%93/Ó/g' $NEW_FILE_NAME

echo Done
