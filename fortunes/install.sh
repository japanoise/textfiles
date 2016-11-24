#!/bin/sh
FORTUNES=$(ls -1 | sed -e '/README.md/d' -e '/install.sh/d' -e'/\.dat$/d' -e'/scriptkitties/d')
FORTDIR='/usr/share/fortune'
if [ ! -d $FORTDIR ]
then
	FORTDIR='/usr/share/games/fortune'
fi
for f in $FORTUNES; do
	echo "Generating ${f}.dat"
	strfile "$f" "${f}.dat"
	echo "Installing $f"
	sudo cp --verbose "$f" "${f}.dat" $FORTDIR
done
