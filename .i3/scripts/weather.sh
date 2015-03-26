#!/bin/bash

# Test for network conection
for interface in $(ls /sys/class/net/ | grep -v lo);
do
	if [[ $(cat /sys/class/net/$interface/carrier) = 1 ]]
	then
		OnLine=1
	fi
done

if ! [ $OnLine ]
then
	echo "Not Online"
	exit;
fi


URL='http://www.accuweather.com/en/ru/saint-petersburg/295212/weather-forecast/295212'
echo $(wget -q -O- "$URL" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print $14", "$10"°С" }'| head -1)