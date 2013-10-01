#!/bin/sh -e

#create a TheGoldminerPi directory
sudo mkdir TheGoldminerPi

#cd into folder
cd TheGoldminerPi

#git clone bfgminer file
sudo apt-get update
apt-get install git autoconf automake libtool pkg-config libcurl4-gnutls-dev libjansson-dev uthash-dev libncurses5-dev
git clone git://github.com/luke-jr/bfgminer.git

#install bfgminer
./autogen.sh
./configure --disable-opencl
make


#setup autostart bfgminer
autostartCmd = '
cd ~/Desktop/TheGoldminerPi
nohup ./bfgminer/bfgminer --config TheGoldminer.conf -S all  >/dev/null 2>&1&

'

lnum=($(sed -n '/<\/head>/=' /etc/rc.local ))  # make array of line numbers
((lnum>0)) && sed -i "${lnum[$((${#lnum[@]}-1))]}i \
                      $autostartCmd" /etc/rc.local



#git clone TheGoldminerPi
git clone git://github.com/medikid/TheGoldminerPi.git

#copy TheGoldminer.conf

#install apache2 and php
sudo apt-get install apache2
sudo apt-get install php5
sudo /etc/init.d/apache2 reload



#create simlink of miner.php, api-example.php in var/www
cd /var/www/
ln -s /home/pi/Desktop/Bitcoin/TheGoldminer/bfgminer/miner.php ./miner.php
ln -s /home/pi/Desktop/Bitcoin/TheGoldminer/bfgminer/api-example.php ./api-example.php


