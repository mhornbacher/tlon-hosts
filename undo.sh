#!/bin/bash

# make sure there is not an existing backup that we would be overriding
if [ ! -f /etc/hosts.backup ]; then
    echo "/etc/hosts.backup does not exist"
    exit 1
fi

# resore the backup
mv /etc/hosts.backup /etc/hosts

# check that the last command worked: https://askubuntu.com/a/29379
if [ $? -eq 0 ]; then
    echo "restored backup"
else
    echo "restore failed"
fi
