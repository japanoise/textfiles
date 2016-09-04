#!/bin/sh
FORTUNES=$(ls -1 | sed -e '/README.md/d' -e '/install.sh/d' -e'/\.dat$/d')
for f in $FORTUNES; do
	echo "Generating ${f}.dat"
	strfile "$f" "${f}.dat"
	echo "Installing $f"
	sudo cp --verbose "$f" "${f}.dat" /usr/share/fortune
done
