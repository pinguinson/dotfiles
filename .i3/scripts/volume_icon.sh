#!/bin/bash

if [ $(amixer get Master | awk '/dB/ { print $6 }') == "[off]" ]
then
	echo ""
else
	echo ""
fi