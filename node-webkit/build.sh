#!/bin/sh
PROJECT="nw-demo"
NWDIR="/home/seba/.node-webkit-v0.10.5"
BASEDIR=$(dirname $0)

echo " Building project \"$PROJECT\"."

# Check node-webkit path
if [ ! -d $NWDIR ]; then
	echo " ERROR: Directory \"$NWDIR\" does not exist. Please set the correct path in the build script."
	exit
fi

# If not already there, make a build directory
if [ ! -d $BASEDIR/build ]; then
	mkdir $BASEDIR/build
	echo " - created build directory"
fi

# Create nw archiv of project
cd $BASEDIR/dev/
zip -q -r ../build/main.nw *
echo " - created zip \"main.nw\""


# Create runnable main file, that doesn't
# require node-webkit to be installed

cd ../build/

# If not already there, copy over nw.pak
if [ ! -f nw.pak ]; then
	if [ ! -f $NWDIR/nw.pak ]; then
		echo " ERROR: Could not find \"$NWDIR/nw.pak\"!"
		exit
	fi

	cp $NWDIR/nw.pak ./nw.pak
fi

# If not already there, copy over icudtl.dat
if [ ! -f icudtl.dat ]; then
	if [ ! -f $NWDIR/icudtl.dat ]; then
		echo " ERROR: Could not find \"$NWDIR/icudtl.dat\"!"
		exit
	fi

	cp $NWDIR/icudtl.dat ./icudtl.dat
fi

# Combine the nw executable and the created nw archiv
# into a standalone application
# The files "nw.pak" and "icutdtl.dat" have to be in the same
# directory as this "main" file!
cat $NWDIR/nw main.nw > main && chmod +x main

echo " - created executable file \"main\""
echo " Done."