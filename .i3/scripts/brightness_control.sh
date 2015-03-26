#!/bin/bash

yet=`cat /sys/class/backlight/nv_backlight/actual_brightness`
max=`cat /sys/class/backlight/nv_backlight/max_brightness`
BIRGHT=/sys/class/backlight/nv_backlight/brightness

bl_up() {
    if [ $yet -lt $max ]; then
        let new=$yet+5
        echo $new > $BIRGHT
    fi
}

bl_down() {
    if [ $yet -gt 0 ]; then
        let new=$yet-5
        echo $new > $BIRGHT
    fi
}

case "$1" in
    'h')
        bl_up
        ;;
    'd')
        bl_down
        ;;
esac