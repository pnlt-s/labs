#!/bin/bash

if [ "$EUID" -ne 0 ]; then
	echo "run as root";	
	exit;
fi

if [ ! -d "/var/count" ]; then
	mkdir "/var/count";
fi

COUNT_SINCE_INSTALL="/var/count/cnt"
COUNT_SINCE_BOOT="/tmp/count"

if [ ! -f $COUNT_SINCE_INSTALL ]; then
	touch $COUNT_SINCE_INSTALL;
	echo "1" >> $COUNT_SINCE_INSTALL;
else
	echo $(( $(<$COUNT_SINCE_INSTALL) + 1 )) > $COUNT_SINCE_INSTALL;
fi

if [ ! -f $COUNT_SINCE_BOOT ]; then
	touch $COUNT_SINCE_BOOT;
	echo "1" >> $COUNT_SINCE_BOOT;
else
	echo $(( $(<$COUNT_SINCE_BOOT) + 1 )) > $COUNT_SINCE_BOOT;
fi

echo "Since install: $(<$COUNT_SINCE_INSTALL)";
echo "Since boot: $(<$COUNT_SINCE_BOOT)";
