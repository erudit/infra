#!/bin/bash

# This script allow us to ssh into the machine and do our ansible command.
# Execute this script if you just did :
# 	vagrant destroy and vagrant up

if [[ $@ < 1 ]] ; then 
    echo "Usage: ./key path/to/Vagrantfile"
    exit
fi

ansible -m ping all

for i in $(cat $1 | grep ip: | sed 's/.*\"\(.*\)\"/\1/')
do
   ssh-keygen -f "$HOME/.ssh/known_hosts" -R $i
done
