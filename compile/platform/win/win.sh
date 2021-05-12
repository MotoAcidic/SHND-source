#!/bin/bash
# Copyright (c) 2021 MotoAcidic

HEIGHT=15
WIDTH=40
CHOICE_HEIGHT=6
BACKTITLE="WindowsCompile Wizard"
TITLE="WindowsCompile Setup"
MENU="Choose either 64bit or 32bit:"

OPTIONS=(1 "Windows 64"
		 2 "Windows 32"
		 0 "Exit Script"
)


CHOICE=$(whiptail --clear\
		--backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        0)  # Exit
		exit	
		;;

        1)	# 64 Bit
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
cd SHND-source/depends
cd depends
make HOST=x86_64-w64-mingw32
cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
make
;;

echo "Open up Winscp and connect to you vps that you compile this with. The location of the exe file is located 
	  CoinCompiled/src/qt/    The exe file will be in the qt folder and has already been striped.
	  If you need to install winscp you can get it here: https://winscp.net/eng/index.php"

		2)	# 32 Bit
###############
# Colors Keys #
###############
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

############################
# Bring in the coins specs #
############################
source ./specs.sh

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
cd SHND-source/depends
make HOST=x86_64-w64-mingw32
cd ..
./autogen.sh
CONFIG_SITE=$PWD/depends/x86_64-w64-mingw32/share/config.site ./configure --prefix=/
make
;;
echo "Open up Winscp and connect to you vps that you compile this with. The location of the exe file is located 
	  CoinCompiled/src/qt/    The exe file will be in the qt folder and has already been striped.
	  If you need to install winscp you can get it here: https://winscp.net/eng/index.php"
esac