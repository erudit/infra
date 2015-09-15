#!/bin/bash

# This script allow us to ssh into the machine and do our ansible command.
# Execute this script if you just did :
# 	vagrant destroy and vagrant up

ansible -m ping all

for (( i=0; i<=3; i++))
do
   ssh-keygen -f "$HOME/.ssh/known_hosts" -R 192.168.35.1$i
done
