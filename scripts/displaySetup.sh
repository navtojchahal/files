#!/bin/bash

current_setup="null"

laptop=$(xrandr | grep "connected"    | grep "288mm x 180mm" | grep -Eo '^[^ ]+')
acer=$(xrandr   | grep "connected"    | grep "474mm x 296mm" | grep -Eo '^[^ ]+')
haier=$(xrandr  | grep "connected"    | grep "900mm x 900mm" | grep -Eo '^[^ ]+')
other=$(xrandr  | grep "disconnected" | grep -Eo '^[^ ]+')

if [[ ! -z "$laptop" ]]; then
    if [[ ! -z "$acer" ]]; then
        xrandr --output $acer --primary --mode 1680x1050 --pos 0x0 --rotate normal --output $laptop --mode 1680x1050 --pos 0x1050 --rotate normal
        current_setup="laptop+acer"
    elif [[ ! -z "$haier" ]]; then
        xrandr --output $haier --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $laptop --mode 1680x1050 --pos 120x1080 --rotate normal
        current_setup="laptop+haier"
    else
        xrandr --output $laptop --primary --mode 1680x1050 --pos 0x0 --rotate normal
        current_setup="laptop"
    fi
elif [[ -z "$laptop" ]]; then
    if [[ ! -z "$acer" ]]; then
        xrandr --output $acer --primary --mode 1680x1050 --pos 0x0 --rotate normal
        current_setup="acer"
    elif [[ ! -z "$haier" ]]; then
        xrandr --output $haier --primary --mode 1920x1080 --pos 0x0 --rotate normal
        current_setup="haier"
    fi
else
    xrandr --output $laptop --primary --mode 1680x1050 --pos 0x0 --rotate normal
    echo -e "\e[1mLaptop Enabled:\e[0m Manually configure display settings.\e[0m"
fi

# OPTION TO VIEW FULL INFO USING COMMAND ARGUMENTS
if [[ "$#" -eq "0" ]]; then
    :
elif [[ "$1" == "-v" ||
        "$1" == "--v" ||
        "$1" == "--ve" ||
        "$1" == "--ver" ||
        "$1" == "--verb" ||
        "$1" == "--verbo" ||
        "$1" == "--verbos" ||
        "$1" == "--verbose" ]]; then
    echo
    case $current_setup in
        laptop       )  echo -e "\e[1m\e[34mPrimary   : Laptop Screen\e[0m" ;;
        acer         )  echo -e "\e[1m\e[34mPrimary   : Acer Monitor\e[0m"  ;;
        haier        )  echo -e "\e[1m\e[34mPrimary   : Haier TV\e[0m"      ;;
        laptop+acer  )  echo -e "\e[1m\e[34mPrimary   : Acer Monitor\e[0m"
                        echo -e "\e[33mSecondary : Laptop Screen\e[0m" ;;
        laptop+haier )  echo -e "\e[1m\e[34mPrimary   : Haier TV\e[0m"
                        echo -e "\e[33mSecondary : Laptop Screen\e[0m" ;;
        *            )  echo -e "\e[1m\e[31mUnknown configuration. Check displaySetup.sh script for errors.\e[0m"
    esac
    echo
elif [[ "$1" == "-h" ||
        "$1" == "--h" ||
        "$1" == "--he" ||
        "$1" == "--hel" ||
        "$1" == "--help" ]]; then
    echo
    echo -e "\e[1mDefault: No command line arguments.\e[0m"
    echo
    echo -e "\e[1mVerbose: -v|--v|--ve|--ver|--verb|--verbo|--verbos|--verbose\e[0m"
    echo
else
    echo
    echo -e "\e[5m\e[91m\e[1mUnknown command line argument(s).\e[0m"
    echo
    echo -e "\e[92m\e[1mHelp : -h|--h|--he|--hel|--help\e[0m"
    echo
fi
