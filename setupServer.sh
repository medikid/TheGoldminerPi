#!/bin/sh -e


#restart apache2
sudo /etc/init.d/apache2 reload

#create simlink of miner.php, api-example.php in var/www
cd /var/www/
sudo git clone git://github.com/MineForeman/MinePeonWebUI.git TheGoldminer

cd TheGoldminer

#miner.php already present inthe repo
#ln -s /home/pi/Desktop/Bitcoin/bfgminer/miner.php ./miner.php

ln -s /home/pi/Desktop/Bitcoin/bfgminer/api-example.php ./api-example.php





