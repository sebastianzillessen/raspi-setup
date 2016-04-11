#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install screen

# add .bash_profile with auto-screen reinit on ssh login
echo 'if [ -z "$STY" ]; then screen -R; fi' >> ~/.bash_profile
