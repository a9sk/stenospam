#/bin/bash

usage(){
    clear
    echo "Usage: stenorun <filename> -fF <flag format>"
    echo ""
    echo "Flag Format"
    echo "      -fF <flag format> to set the flag format (i.e. if -fF is set to 'abc' the flag format will be abc{flag_goes_here})"
    echo ""
    echo "Miscellaneous"
    echo "      -h  show this message and exits"
    echo ""
    echo "@a9sk"
    sleep 1
    exit
}

file_check(){
    if [ ! -e FILENAME ] ; then
        echo "[!] The file does not exist"
        sleep 0.1
        echo "[*] Exiting..."
        exit
    fi
    echo "[*] The file exists, starting the various tools..."
    sleep 0.2
}

main(){
    file_check
}

declare -g FORMAT
declare -g FILENAME
FILENAME=$1

main