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

        1)	
        cd 
        cd SHND-source/compile/platform/64/
        bash 64.sh

        2)	
        cd 
        cd SHND-source/compile/platform/32/
        bash 32.sh