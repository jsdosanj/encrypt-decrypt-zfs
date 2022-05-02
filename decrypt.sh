#!/bin/sh

#Receive the key
cd /root
curl -s -O http://keys.test.omnigroup.com/pg2.private.omnigroup.com/pg2.txt

#Load the key
zfs load-key -L file:///root/pg2.txt zroot/usr/data

#Mount the file system
zfs mount zroot/usr/data

#Remove the key from the system
rm /root/pg2.txt