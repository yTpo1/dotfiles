#!/bin/sh

#⛁ 
FREE_STORAGE=$(df -h | awk '{if ($1 == "/dev/sda2") {print $4} }')

echo ⛁ $FREE_STORAGE

exit 0
