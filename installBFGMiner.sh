#!/bin/sh -e

#come out of TheGoldminerPi folder to create a TheGoldminerPi directory
cd ~/Desktop/Bitcoin/

#clone git repository of bfgminer
git clone git://github.com/luke-jr/bfgminer.git ;

#install bfgminer
cd bfgminer
sudo ./autogen.sh ;
sudo ./configure --disable-avalon --disable-opencl --disable-adl  --disable-bitfury  --disable-bigpic  --disable-littlefury --disable-bitforce   --disable-modminer --disable-x6500 --disable-ztex --with-system-libblkmaker ;

sudo make;
cd ..
