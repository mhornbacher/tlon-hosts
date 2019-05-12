#!/bin/bash

# make sure that the hosts.txt file exists
if [ ! -f ./hosts.txt ]; then
    echo "Hosts.txt does not exist"
    exit 1
fi

# make sure there is not an existing backup that we would be overriding
if [ -f /etc/hosts.backup ]; then
    echo "/etc/hosts.backup exists. Script was likely already run"
    exit 1
fi

# create backup
cp /etc/hosts /etc/hosts.backup

# add hosts changes
cat ./hosts.txt >> /etc/hosts

# check that the last command worked: https://askubuntu.com/a/29379
if [ $? -eq 0 ]; then
    echo "Hosts added succesfully"
else
    rm /etc/hosts.backup
    echo "Failed to add hosts"
    exit 1
fi
