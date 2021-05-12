#!/bin/bash
# Copyright (c) 2021 MotoAcidic

###############
# Colors Keys #
###############
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

###################
# Install Depends #
###################
DEPENDS_PATH="SHND-source/compile/Depends/"
cd
cd $DEPENDS_PATH
bash WindowsDepends.sh
clear
echo VPS Server prerequisites installed.


####################
# Compile the Coin #
####################
cd
cd sudo chmod -R 755 SHND-source
cd SHND-source/depends
cd depends
make HOST=x86_64-w64-mingw32
cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
make

echo "Open up Winscp and connect to you vps that you compile this with. The location of the exe file is located 
	  CoinCompiled/src/qt/    The exe file will be in the qt folder and has already been striped.
	  If you need to install winscp you can get it here: https://winscp.net/eng/index.php"