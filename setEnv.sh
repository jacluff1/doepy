#!/bin/bash
# script tested on Ubuntu 18.04.3 LTS using Python 3.6.8

# set repo home directory
home=$(pwd)
printf "\ninstalling in $home\n"

# virtual environment directory name
venv="doepyVenv"

# if there is no python virtual environment set up, set it up
if [ ! -d "$home/$venv" ]; then
    printf "\ninstalling venv...\n"
    sudo apt install python3-venv
    printf "setting up virtual environment '$venv' in $home...\n"
    python3 -m venv $venv
    printf "setting up djak suite...\n"
    mkdir djak && cd djak
    printf "adding auxillary functions to djak suite...\n"
    git clone https://github.com/jacluff1/auxillary_dev.git
    cd $home
fi

# activate virtual environment
source activateEnv.sh

# install/upgrade packages
pip install -U -r requirements.txt --no-cache-dir

# pull latest from djak suite
cd djak/auxillary_dev && git checkout master && git pull && cd $home

# install tkinter for interactive plots
sudo apt-get install python3-tk

# give permisions to run runit.sh
chmod 755 runit.sh
