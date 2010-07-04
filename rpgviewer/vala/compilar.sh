#!/bin/bash
valac -X -I../../librpg/vala -X -L../../librpg/vala -X -lrpg -o rpgviewer main.vala ../../librpg/vala/rpg.vapi --basedir ./

echo "Now type 
	LD_LIBRARY_PATH=../../librpg/vala ./rpgviewer
to run the app"
