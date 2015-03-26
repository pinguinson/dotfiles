#!/bin/bash

if [ $(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk '/state/ { print $2 }') == "discharging" ]
then
	echo ""
else
	echo ""
fi