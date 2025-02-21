# !/bin/bash

cp -r /data/data/com.termux/files/home/storage/Music/Backups_nicks/GPG_keys/.password_store /data/data/com.termux/files/home
cp -r /data/data/com.termux/files/home/storage/Music/Backups_nicks/GPG_keys/public-key-wild.gpg /data/data/com.termux/files/home

cp -r /data/data/com.termux/files/home/storage/Music/Backups_nicks/GPG_keys/private-key-wild.gpg /data/data/com.termux/files/home


gpg --import public-key-wild.gpg
gpg --import private-key-wild.gpg

rm -rf /data/data/com.termux/files/home/storage/Music/Backups_nicks/GPG_keys/.password_store
rm -rf /data/data/com.termux/files/home/storage/Music/Backups_nicks/GPG_keys/public-key-wild.gpg
rm -rf /data/data/com.termux/files/home/storage/Music/Backups_nicks/GPG_keys/private-key-wild.gpg
