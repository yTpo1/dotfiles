#!/bin/bash

#NEW_FILE_NAME=$(echo $1 | awk -F'[_.]' '{print $4}')

NEW_FILE_NAME=${1%.*}_new.m3u

#printf "%s" "$(<$1)" >> $NEW_FILE_NAME
FILE=$(printf "%s" "$(<$1)")

echo $(printf $FILE) >> $NEW_FILE_NAME

#printf $1 >> $NEW_FILE_NAME

#sed -i -- 's/%20/ /g' $1
#sed -i -- 's/%2C/,/g' $1
#sed -i -- 's/%3B/;/g' $1
#
#sed -i -- 's/%26/\&/g' $1
#sed -i -- "s/%27/'/g" $1
#sed -i -- 's/%28/(/g' $1
#sed -i -- 's/%29/)/g' $1
#
#sed -i -- 's/%E2%80%93/–/g' $1
#
#sed -i -- 's/%E2%80%99/’/g' $1
#sed -i -- 's/%C3%A0/à/g' $1
#sed -i -- 's/%C3%A9/é/g' $1
#sed -i -- 's/%C3%A8/è/g' $1
#sed -i -- 's/%C3%89/É/g' $1
#sed -i -- 's/%C3%93/Ó/g' $1

echo Done
