#!/bin/bash
laptop=$(xrandr | grep "connected" | grep "288mm x 180mm" | grep -Eo '^[^ ]+')
acer=$(xrandr | grep "connected" | grep "474mm x 296mm" | grep -Eo '^[^ ]+')
haier=$(xrandr | grep "connected" | grep "1000mm x 1000mm" | grep -Eo '^[^ ]+')
other=$(xrandr | grep "disconnected" | grep -Eo '^[^ ]+')

echo && xrandr | grep " connected"
echo && xrandr | grep "disconnected"

if [[ ! -z "$laptop" ]]; then
    if [[ ! -z "$acer" ]]; then
        echo
        echo "xrandr --output $acer --primary --mode 1680x1050 --pos 0x0 --rotate normal --output $laptop --mode 1680x1050 --pos 0x1050 --rotate normal"
        echo
        echo "Acer Monitor (Primary)"
        echo "Laptop Screen (Secondary)"
        echo
        xrandr --output $acer --primary --mode 1680x1050 --pos 0x0 --rotate normal --output $laptop --mode 1680x1050 --pos 0x1050 --rotate normal
    elif [[ ! -z "$haier" ]]; then
        echo
        echo "xrandr --output $haier --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $laptop --mode 1680x1050 --pos 120x1080 --rotate normal"
        echo
        echo "Haier TV (Primary)"
        echo "Laptop Screen (Secondary)"
        echo
        xrandr --output $haier --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $laptop --mode 1680x1050 --pos 120x1080 --rotate normal
    else
        echo
        echo "xrandr --output $laptop --primary --mode 1680x1050 --pos 0x0 --rotate normal"
        echo
        echo "Laptop Screen (Primary)"
        echo
        xrandr --output $laptop --primary --mode 1680x1050 --pos 0x0 --rotate normal
    fi
elif [[ -z "$laptop" ]]; then
    if [[ ! -z "$acer" ]]; then
        echo "Acer Monitor (Primary)"
        xrandr --output $acer --primary --mode 1680x1050 --pos 0x0 --rotate normal
    elif [[ ! -z "$haier" ]]; then
        echo "Haier TV (Primary)"
        xrandr --output $haier --primary --mode 1920x1080 --pos 0x0 --rotate normal
    fi
else
    echo
    echo "xrandr --output $laptop --primary --mode 1680x1050 --pos 0x0 --rotate normal"
    echo
    echo "Laptop Enabled: Manually configure display settings."
    echo
    xrandr --output $laptop --primary --mode 1680x1050 --pos 0x0 --rotate normal
fi

# Number of total arguments # echo "Total number of arguments: $#"
# Reading argument value # echo "First argument value: $1"

# Laptop only: xrandr --output $internal --primary --mode 1366x768 --pos 0x0 --rotate normal --output $external --off --output $extra --off

# Acer Monitor only: xrandr --output $external --primary --mode 1680x1050 --pos 0x0 --rotate normal --output $internal --off --output $extra --off

# Haier TV only: xrandr --output $external --primary --mode 1920x1080 --pos 0x0 --rotate normal --output $internal --off --output $extra --off