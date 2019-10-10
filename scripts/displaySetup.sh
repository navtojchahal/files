#!/bin/bash
internal=eDP-1
external=HDMI-1
extra=DP-1

if xrandr | grep "$external connected"; then
echo
    if [ "$#" -eq "0" ]; then
        echo "External Monitor: ACER Monitor"
        xrandr --output $internal --mode 1366x768 --pos 157x1050 --rotate normal --output $external --primary --mode 1680x1050 --pos 0x0 --rotate normal --output $extra --off
        echo
    elif [ "$#" -eq "1" ]; then
        if [ "$1" -le "5" ]; then
            case $1 in
                0)
                    echo "External Monitor: None"
                    xrandr --output $internal --primary --mode 1366x768 --pos 0x0 --rotate normal --output $external --off --output $extra --off
                    echo;;
				1|a|A)
                    echo "External Monitor: Haier TV"
                    xrandr --output $internal --mode 1366x768 --pos 277x1080 --rotate normal --output $external --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $extra --off
                    echo;;
                *)
                    echo "The options are:    1|a|A) Haier TV"
                    echo "                    2|b|B) To be added..."
                    echo;;
            esac
        else
            echo Less than 5 options are avaiable.
            echo
        fi
    else
        echo Max argument length is 1 digit.
        echo
    fi
else
	xrandr --output $internal --primary --mode 1366x768 --pos 0x0 --rotate normal --output $external --off --output $extra --off
fi

# Number of total arguments # echo "Total number of arguments: $#"
# Reading argument value # echo "First argument value: $1"

# Laptop only: xrandr --output $internal --primary --mode 1366x768 --pos 0x0 --rotate normal --output $external --off --output $extra --off

# Acer Monitor only: xrandr --output $external --primary --mode 1680x1050 --pos 0x0 --rotate normal --output $internal --off --output $extra --off

# Haier TV only: xrandr --output $external --primary --mode 1920x1090 --pos 0x0 --rotate normal --output $internal --off --output $extra --off

# Laptop + Acer Monitor: xrandr --output $internal --mode 1366x768 --pos 157x1050 --rotate normal --output $external --primary --mode 1680x1050 --pos 0x0 --rotate normal --output $extra --off

# Laptop + Haier TV: xrandr --output $internal --mode 1366x768 --pos 277x1050 --rotate normal --output $external --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $extra --off
