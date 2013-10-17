#!/bin/sh -e

cd /home/pi/Desktop ;

sudo mkdir -p Bitcoin ;

cd /home/pi/Desktop/Bitcoin ;

sudo git clone git://github.com/medikid/TheGoldminerPi.git ;
cd /home/pi/Desktop/Bitcoin/TheGoldminerPi ;

#set all .sh files executables
sudo chmod +x *.sh ;


#cd ~/Desktop/Bitcoin/TheGoldminerPi/

#prepare system
sudo ./upgradeSystem.sh ;
sudo ./updateSystem.sh ;
sudo ./installDeps.sh ;

#now delete files that are downloaded but not used/installed, significantly reduceds diskspace
sudo apt-get autoclean ;

#Install bfgminer
sudo ./installBFGMiner.sh ;

#install stratum-proxy
sudo ./installStratumProxy.sh ;

#setup automining
sudo ./setAutoMining.sh ;


#setup network
#sudo ./setupWIFI.sh;

#setup bridge
sudo ./setupBRIDGE.sh ;

#restart network to appply new settings
sudo /etc/init.d/networking restart ;

#setup apache server
sudo ./setupServer.sh ;

