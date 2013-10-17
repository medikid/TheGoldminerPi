#!/bin/sh -e

#setup autostart bfgminer -- replace line that starts (^) with exit 0
sudo sed -i '/^exit 0/i \
\
\
#bfgminer commands \
#nohup ./home/pi/Desktop/Bitcoin/bfgminer/bfgminer -o stratum.btcguild.com:3333 -u TheGoldminer_BLADE1 -p BLADE1 >/dev/null 2>&1& \
#nohup ./home/pi/Desktop/Bitcoin/bfgminer/bfgminer --http-port 8330 -o stratum.btcguild.com:3333 -u TheGoldminer_BLADE1 -p BLADE1 >/dev/null 2>&1& \
nohup ./home/pi/Desktop/Bitcoin/bfgminer/bfgminer --http-port 8330 -o stratum.btcguild.com:3333 -u TheGoldminer_BLADE1 -p BLADE1 >/dev/null 2>&1& \
\
\
#stratum proxy commands \
#nohup ./home/pi/Desktop/Bitcoin/stratum-mining-proxy/mining_proxy.py >/dev/null 2>&1& \
#nohup ./home/pi/Desktop/Bitcoin/stratum-mining-proxy/mining_proxy.py -o stratum.btcguild.com -p 3333 >/dev/null 2>&1& \
\
\
' /etc/rc.local ;
