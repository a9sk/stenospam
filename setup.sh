#!/bin/bash

if ! command -v strings &> /dev/null
then
    read -p "$(echo -e '[?] Strings not installed, do you want to install it?'$i' (y/n) ')" ok
    if [[ $ok == "" ]]
    then
        sudo apt-get update
        sudo apt-get install strings
    else
        case $ok in
            [Yy]* )
                echo "[*] Installing strings..."
                sudo apt-get update
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