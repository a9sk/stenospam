#!/bin/bash

sudo apt-get update
sudo apt update

if ! command -v strings &> /dev/null
then
    read -p "$(echo -e '[?] Strings not installed, do you want to install it?'$i' (y/n) ')" ok
    if [[ $ok == "" ]]
    then
        sudo apt-get install strings
    else
        case $ok in
            [Yy]* )
                echo "[*] Installing strings..."
                sudo apt-get install strings
                if command -v strings &> /dev/null; then
                    echo "[*] Ok, strings installed correctly"
                else
                    echo "[!] There was a problem installing strings, try manual installation"
            fi;;
            * )  echo "[*] Ok, strings will not be installed";;
        esac
    fi
else
    echo "[*] Strings is installed, continuing..."
fi

if ! command -v exiftool &> /dev/null
then
    read -p "$(echo -e '[?] Exiftool not installed, do you want to install it?'$i' (y/n) ')" ok
    if [[ $ok == "" ]]
    then
        sudo apt install exiftool
    else
        case $ok in
            [Yy]* )
                echo "[*] Installing exiftool..."
                sudo apt install exiftool
                if command -v exiftool &> /dev/null; then
                    echo "[*] Ok, exiftool installed correctly"
                else
                    echo "[!] There was a problem installing exiftool, try manual installation"
            fi;;
            * )  echo "[*] Ok, exiftool will not be installed";;
        esac
    fi
else
    echo "[*] Exiftool is installed, continuing..."
fi

if ! command -v exiv2 &> /dev/null
then
    read -p "$(echo -e '[?] Exiv2 not installed, do you want to install it?'$i' (y/n) ')" ok
    if [[ $ok == "" ]]
    then
        sudo apt-get -y install exiv2
    else
        case $ok in
            [Yy]* )
                echo "[*] Installing exiv2..."
                sudo apt-get -y install exiv2
                if command -v exiv2 &> /dev/null; then
                    echo "[*] Ok, exiv2 installed correctly"
                else
                    echo "[!] There was a problem installing exiv2, try manual installation"
            fi;;
            * )  echo "[*] Ok, exiv2 will not be installed";;
        esac
    fi
else
    echo "[*] Exiv2 is installed, continuing..."
fi
