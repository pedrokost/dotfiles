#!/bin/sh
# Updates screen brightnes

# If it doesn't work, run:
# sudo chown pedro:users /sys/class/backlight/radeon_bl0/brightness

# echo 100 > /sys/class/backlight/radeon_bl0/brightness

current=`cat /sys/class/backlight/radeon_bl0/actual_brightness`
max=`cat /sys/class/backlight/radeon_bl0/max_brightness`
step=10

bl_up() {
    if [ $current -lt $max ]; then
        new=$(( $current+$step ))
        echo $new > /sys/class/backlight/radeon_bl0/brightness
    else
        echo "It won't get any brighter than that"
    fi
}

bl_down() {
    if [ $current -gt 0 ]; then
        new=$(( $current-$step ))
        echo $new
        echo $new > /sys/class/backlight/radeon_bl0/brightness
    else
        echo "It won't get any darker than that"
    fi
}

bl_set() {
    if [ $# -eq 1 ] && [ $1 -gt 0 ] && [ $1 -lt $max ]; then
        echo $1 > /sys/class/backlight/radeon_bl0/brightness
    else
        echo "Too small or missing parameter"
    fi
}


case "$1" in
    'b')
        bl_up
        ;;
    'd')
        bl_down
        ;;
    's')
        bl_set $2
        ;;
    'c')
        echo "Current brightness $current von $max"
        ;;
    *)
        echo "brightness.sh b (brighter) | d (darker) | s <value> (set) | c (current)"
esac