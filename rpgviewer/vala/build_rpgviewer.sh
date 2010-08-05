#!/bin/bash

########################
# FUNCTIONS:
########################

function do_generate_c_code {
	echo ""
	echo ""	
	echo "COMPILING VALA TO C CODE AND CREATING LINUX BINARY..."
	valac -C -X -I../../librpg/vala -X -L../../librpg/vala -X -lrpg --pkg libxml-2.0 -o rpgviewer main.vala ../../librpg/vala/rpg.vapi --basedir ./

}


function do_compile {
	set -e
	
	echo ""
	echo ""	
	echo "COMPILING CODE DIRECTLY FROM VALA SOURCES..."
	valac -X -I../../librpg/vala -X -L../../librpg/vala -X -lrpg --pkg libxml-2.0 -o rpgviewer main.vala ../../librpg/vala/rpg.vapi --basedir ./

}	


function do_compile_windows {
	set -e
	
	WIN_PREFIX="/usr/i486-mingw32"
	export PKG_CONFIG_PATH="$WIN_PREFIX/lib/pkgconfig"
	
	echo ""
	echo ""	
	echo "CROSSCOMPILING C CODE FOR windows, CREATING EXECUTABLE..."
	
	i486-mingw32-gcc main.c -o rpgviewer.exe -L../../librpg/vala  -I../../librpg/vala -lrpg `pkg-config --define-variable=prefix=$WIN_PREFIX --cflags --libs gobject-2.0`
}

function do_clean  {
	
	rm *.c rpgviewer rpgviewer.exe example_generated*.xml
	
}


####################
# MAIN 
####################

if [ "$1" == "clean" ]; then

	do_clean

#windows crosscompilation
elif [ "$1" == "windows" ]; then

	do_generate_c_code
	do_compile_windows

else 
	
	do_compile
	
	echo "Now type 
	LD_LIBRARY_PATH=../../librpg/vala ./rpgviewer
to run the app"


fi

echo "DONE!"
