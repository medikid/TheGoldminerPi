#!/bin/sh -e

cd ~/Desktop

sudo mkdir -p Bitcoin ;

cd Bitcoin;

sudo git clone git://github.com/medikid/TheGoldminerPi.git ;
cd TheGoldminerpi;


#cd ~/Desktop/Bitcoin/TheGoldminerPi/

#prepare system
sudo ./upgradeSystem.sh ;
sudo ./updateSystem.sh ;
sudo ./installDeps;

#Install bfgminer
sudo ./installBFGMiner.sh;

#install stratum-proxy
sudo ./installStratumProxy.sh;

#setup automining
sudo ./setAutoMining.sh;


#setup network
#sudo ./setupWIFI.sh;

#setup bridge
sudo ./setupBRIDGE.sh ;


#setup apache server
sudo ./setupServer.sh;

