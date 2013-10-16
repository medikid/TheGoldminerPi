#!/bin/sh -e

cd ~/Desktop

sudo mkdir -p Bitcoin ;

cd ~/Desktop/Bitcoin ;

sudo git clone git://github.com/medikid/TheGoldminerPi.git ;
cd ~/Desktop/Bitcoin/TheGoldminerPi ;

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


#setup apache server
sudo ./setupServer.sh ;

