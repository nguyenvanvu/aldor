#!/bin/bash

set -e 

echo "COMPILING VALA TO C CODE..."
valac -X -I../../librpg/vala -X -L../../librpg/vala -X -lrpg --pkg libxml-2.0 -o rpgviewer main.vala ../../librpg/vala/rpg.vapi --basedir ./

echo "

DONE!
"

echo "Now type 
	LD_LIBRARY_PATH=../../librpg/vala ./rpgviewer
to run the app"
