#!/bin/sh -e

#create a TheGoldminerPi directory
sudo mkdir -p Bitcoin

#cd into folder
cd Bitcoin

#install git as you need it
sudo apt-get install git

#git clone TheGoldminerPi //install Thegoldminer.conf
git clone git://github.com/medikid/TheGoldminerPi.git

cd TheGoldminerPi
sudo ./setup.sh
