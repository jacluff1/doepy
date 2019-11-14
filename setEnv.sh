#!/bin/bash
# script tested on Ubuntu 18.04.3 LTS using Python 3.6.8

# update os
sudo apt-get update
sudo apt-get autoremove

# set repo home directory
home=$(pwd)
printf "\ninstalling in $home\n"

# virtual environment directory name
venv="doepyVenv"

# if there is no python virtual environment set up, set it up
if [ ! -d "$home/$venv" ]; then
    printf "\ninstalling venv ..\n"
    sudo apt install python3-venv
    printf "setting up virtual environment '$venv' in $home...\n"
    python3 -m venv $venv
fi

# activate virtual environment
source activateEnv.sh

# install/upgrade packages
pip install -U -r requirements.txt --no-cache-dir

# install tkinter for interactive plots
sudo apt-get install python3-tk

# give permisions to run runit.sh
chmod 755 runit.sh
