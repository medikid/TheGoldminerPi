#!/bin/sh -e

#come out of TheGoldminerPi folder to create a TheGoldminerPi directory
cd /home/pi/Desktop/Bitcoin ;

#git clone slash stratum proxy repo
git clone git://github.com/slush0/stratum-mining-proxy.git ;

#get into the dir
cd stratum-mining-proxy ;

# Development package of Python are necessary
sudo apt-get install python-dev ;

# This will upgrade setuptools package
sudo python distribute_setup.py ;

# This will install required dependencies (namely Twisted and Stratum libraries), but don't install the package into the system.
sudo python setup.py develop ;

#--------- MIDSTATE NOT POSSIBLE WTH RASPI VERSION - targe chip incomptaptible -------------#
#compile with midstate c extensions, will speeds up midstate calculations
#cd midstatec ;
#sudo make ;
cd .. ;
