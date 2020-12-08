#!/usr/bin/env bash

# Ensure apt-get world is as sane as possible.
sudo apt-get -y update
sudo apt-get -y upgrade
sudo apt-get dist-upgrade -y
sudo apt-get autoremove -y

# On the vagrant machine ...
# Set up ntp to keep the vagrant machine in time (vagrant/virtualbox loses sync when some hosts sleep.)
sudo apt-get -y install ntp ntpdate

# Install git
sudo apt-get -y install git

