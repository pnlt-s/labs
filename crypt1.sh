#!/bin/bash
if [ -z $1 ]; then
	echo "enter dir";
	exit;
fi
if [ -z $2 ]; then
	echo "enter ext";
	exit;
else
	if grep -q "^\." <<< "$2"; then
		echo "enter ext without dot";
		exit;
	fi
fi

if [ -d $1 ]; then
	for file in $1/*
	do
		if [ -f ${file} ]; then
			if grep "^[0-9]" ${file}; then
				mv ${file} ${file}.$2
			fi
		fi
	done
else
	echo "dir not exist"
fi

