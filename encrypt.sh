#!/bin/sh

#Create a ZFS Encrypted File System in the raw keyformat
dd if=/dev/urandom bs=32 count=1 of=/root/pg2.txt
zfs create -o encryption=on -o keylocation=file:///root/pg2.r -o keyformat=raw zroot/usr/data

#List new encrypted file system
zfs list -r zroot/usr/data

#Get keystatus of new file system
zfs get keystatus zroot/usr/data

#Get encryption status of new file system
zfs get encryption zroot/usr/data

#Send encryption key to keys.test server
cd /root
ls -la 
rsync -a /root/pg2.txt admin@keys.test.omnigroup.com:/home/admin/keys/.
rsync -a /root/pg2.txt admin@keys.test.omnigroup.com:/var/www/keys-test/pg2.private.omnigroup.com/.

#End this script
exec "$SHELL"