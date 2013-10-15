#!/bin/sh -e


#setup autostart bfgminer
sudo sed -i '/exit 0/i \
 cd ~/Desktop/Bitcoin \
 nohup ./bfgminer/bfgminer --config TheGoldminerPi/miner_config.conf -S all  >/dev/null 2>&1& \
 
 #nohup ./bfgminer/bfgminer --http-port 8332 --config TheGoldminerPi/miner_config.conf -S all  >/dev/null 2>&1&

' /etc/rc.local;



