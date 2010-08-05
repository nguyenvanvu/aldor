#!/bin/bash

########################
# FUNCTIONS:
########################

function do_generate_c_code {
	echo ""
	echo ""	
	echo "COMPILING VALA TO C CODE..."
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
	echo "CROSSCOMPILING C CODE TO $1, CREATING C LIB..."
	
	i486-mingw32-gcc main.c -o rpgviewer.exe -mms-bitfields -I$WIN_PREFIX/include/glib-2.0 -I$WIN_PREFIX/lib/glib-2.0/include -I../../librpg/vala -L$WIN_PREFIX/lib -L$WIN_PREFIX/bin -L../../librpg/vala -lrpg -lgobject-2.0 -lgthread-2.0 -lglib-2.0
	
	
}

function do_clean  {
	
	rm *.c rpgviewer rpgviewer.exe
	
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
