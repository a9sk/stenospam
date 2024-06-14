#/bin/bash

usage(){
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
    if [ ! -f $FILEPATH ] ; then
        echo "[!] The file does not exist"; echo ""
        sleep 0.1
        usage
    fi
    echo "[*] The file exists, starting the various tools..."
    sleep 0.2
}

set_format(){
    if [ "$1" == '-fF' ]; then # 1 is 2 and 2 is 3...
        FORMAT="$2"
        echo "[*] The flag format is set to $FORMAT{flag_goes_here}"
    else
        echo "[!] Invalid parameters passed"; echo ""
        sleep 0.1
        usage
    fi
}

try_strings(){
    echo "[*] Trying strings enumeration and filtering"
    if ! command -v strings &> /dev/null
    then
        echo "[!] Strings command is missing, install it or run the setup"
    else
        local STRING_RESULT=$(strings -a $FILENAME > strings_$FILENAME.txt | grep -o '$FORMAT{[^}]*}')
        if [ -z "$STRING_RESULT"]; then
            echo "[*] No clear flag was found using the strings command"
        else
            echo "[!] Corrispondence found: $STRING_RESULT"
        fi
    fi
}

try_exiftool(){
    echo "[*] Trying exiftool enumeration and filtering"
    if ! command -v exiftool &> /dev/null
    then
        echo "[!] Exiftool command is missing, install it or run the setup"
    else
        local STRING_RESULT=$(exiftool $FILENAME > exiftool_$FILENAME.txt | grep -o '$FORMAT{[^}]*}')
        if [ -z "$STRING_RESULT"]; then
            echo "[*] No clear flag was found using the exiftool command"
        else
            echo "[!] Corrispondence found: $STRING_RESULT"
        fi
    fi
}

try_exiv2(){
    echo "[*] Trying exiv2 enumeration and filtering"
    if ! command -v exiv2 &> /dev/null
    then
        echo "[!] Exiv2 command is missing, install it or run the setup"
    else
        local STRING_RESULT=$(exiv2 $FILENAME > exiv2_$FILENAME.txt | grep -o '$FORMAT{[^}]*}')
        if [ -z "$STRING_RESULT"]; then
            echo "[*] No clear flag was found using the exiv2 command"
        else
            echo "[!] Corrispondence found: $STRING_RESULT"
        fi
    fi
}

try_binwalk(){
    echo "[*] Trying binwalk enumeration and filtering"
    if ! command -v binwalk &> /dev/null
    then
        echo "[!] Binwalk command is missing, install it or run the setup"
    else
        local STRING_RESULT=$(binwalk --log=binwalk_$FILENAME.txt $FILENAME | grep -o '$FORMAT{[^}]*}')
        if [ -z "$STRING_RESULT"]; then
            echo "[*] No clear flag was found using the binwalk command"
        else
            echo "[!] Corrispondence found: $STRING_RESULT"
        fi
    fi
}

main(){
    echo "Starting the enumerations:"
    try_strings
    try_exiftool
    try_exiv2
    try_binwalk
}

clear

declare -g FORMAT
declare -g FILENAME
declare -g CURRENTPATH
declare -g FILEPATH

CURRENTPATH="$(pwd)"

if [ "$1" == '-h' ]; then
    usage
    elif [ -z "$1" ]; then
    echo "[!] No parameter was passed..."; echo ""
    sleep 0.1
    usage
fi

FILENAME=$1
FILEPATH="$CURRENTPATH/$FILENAME"

file_check
if [ -z "$2" ] || [ -z "$3" ]; then #if parameter 3 exist then parameter 2 also exists
    FORMAT="flag"
    echo "[*] The flag format is set to $FORMAT{flag_goes_here}"
else
    set_format $2 $3
fi

main
