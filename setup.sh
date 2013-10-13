#!/bin/sh -e

#come out of TheGoldminerPi folder to create a TheGoldminerPi directory
cd ..

#update dependenaceis and git clone bfgminer file
sudo apt-get -m -f upgrade
sudo apt-get -m -f update
sudo apt-get -m -f install build-essential autoconf automake libtool pkg-config libcurl4-gnutls-dev libjansson-dev uthash-dev libncurses5-dev libudev-dev libusb-1.0-0-dev libmicrohttpd-dev curl

git clone git://github.com/luke-jr/bfgminer.git

#install bfgminer
cd bfgminer
./autogen.sh
./configure --disable-avalon --disable-opencl --disable-adl  --disable-bitfury  --disable-bigpic  --disable-littlefury --disable-bitforce   --disable-modminer --disable-x6500 --disable-ztex --with-system-libblkmaker

make
cd ..

#setup autostart bfgminer
sudo sed -i '/exit 0/i \
 cd ~/Desktop/Bitcoin \
 nohup ./bfgminer/bfgminer --config TheGoldminerPi/miner_config.conf -S all  >/dev/null 2>&1& \

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





