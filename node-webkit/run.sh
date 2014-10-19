#!/bin/sh

BASEDIR=$(dirname $0)
cd $BASEDIR/build/

if [ -f main ]; then
	./main
else
	echo " ERROR: No file \"main\" found!"
fi