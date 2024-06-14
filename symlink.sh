#!/bin/bash

THIS_DIR_PATH="$(dirname "$(realpath "$0")")"

THIS_SCRIPT_PATH="$THIS_DIR_PATH/steno.sh"

if [ -e "$THIS_SCRIPT_PATH" ]; then
    echo "[*] Starting the setup process"
else
    echo "[!] You are running this file from the wrong directory"
    sleep 1
    echo "[!] Make sure to run this file from the directory where is present the file steno.sh"
    sleep 1
    echo "[!] Exiting..."
    exit
fi

SCRIPT_SAVE="/usr/local/bin/stenorun"
sleep 1

echo "[*] Verify if the file steno.sh is runnable"
sleep 1
chmod +x "$THIS_SCRIPT_PATH" || {
    echo "[!] Impossible to set steno.sh as runnable"
    echo '[!] In case of any problem contact @a9sk at 920a9sk765@proton.me'
    sleep 1
    echo "[!] Exiting..."
    exit 1
}

sleep 1
echo "[*] Creating a symlink for the steno.sh script"
sudo ln -s "$THIS_SCRIPT_PATH" "$SCRIPT_SAVE" || {
    echo "[!] Impossible to create the symlink"
    echo '[!] In case of any problem contact @a9sk at 920a9sk765@proton.me'
    sleep 1
    echo "[!] Exiting..."
    exit 1
}
sleep 1
echo "[*] Symlink created with success"
sleep 1
echo '[*] Try running the stenorun command'
echo '[!] In case of any problem contact @a9sk at 920a9sk765@proton.me'