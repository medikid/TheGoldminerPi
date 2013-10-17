#!/bin/sh -e


#setup autostart bfgminer
sudo sed -i '/exit 0/i \
 cd /home/pi/Desktop/Bitcoin \
 
 #nohup ./bfgminer/bfgminer --config TheGoldminerPi/miner_config.conf -S all  >/dev/null 2>&1& \
 
 #nohup ./bfgminer/bfgminer --http-port 8330 --config TheGoldminerPi/miner_config.conf -S all  >/dev/null 2>&1& \
 
 nohup ./bfgminer/bfgminer --http-port 8330 -o stratum.btcguild.com:3333 -u TheGoldminer_BLADE1 -p BLADE1  >/dev/null 2>&1& \
 
 #nohup ./stratum-mining-proxy/mining_proxy.py >/dev/null 2>&1& \
 #nohup ./stratum-mining-proxy/mining_proxy.py -o stratum.btcguild.com -p 3333  >/dev/null 2>&1& \

' /etc/rc.local ;



