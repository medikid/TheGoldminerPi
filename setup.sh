#!/bin/sh -e

#come out of TheGoldminerPi folder to create a TheGoldminerPi directory
cd ..

#git clone bfgminer file
sudo apt-get -m -f update
apt-get -m -f install autoconf automake libtool pkg-config libcurl4-gnutls-dev libjansson-dev uthash-dev libncurses5-dev
git clone git://github.com/luke-jr/bfgminer.git

#install bfgminer
cd bfgminer
./autogen.sh
./configure --disable-opencl
make
cd ..

#setup autostart bfgminer
sudo sed -i '/exit 0/i \
 cd ~/Desktop/Bitcoin \
 nohup ./bfgminer/bfgminer --config TheGoldminerPi/TheGoldminer.conf -S all  >/dev/null 2>&1& \

' /etc/rc.local;


#install apache2 and php
sudo apt-get install apache2
sudo apt-get install php5
sudo /etc/init.d/apache2 reload



#create simlink of miner.php, api-example.php in var/www
cd /var/www/
sudo mkdir -p TheGoldminer
cd TheGoldminer
ln -s /home/pi/Desktop/Bitcoin/bfgminer/miner.php ./miner.php
ln -s /home/pi/Desktop/Bitcoin/bfgminer/api-example.php ./api-example.php





