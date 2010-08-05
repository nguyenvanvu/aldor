 #!/bin/bash
 
 
########################
# FUNCTIONS:
########################


function do_generate_vala_enums {
	
	echo "GENERATING SKILL ENUMs FROM SQLITE DB..."
	./gen_enum.sh
	
}

function do_generate_c_code {
	echo ""
	echo ""	
	echo "COMPILING VALA TO C CODE..."
	valac -C -g -H rpg.h --library=rpg --pkg libxml-2.0 --pkg sqlite3 --basedir=./ `ls *.vala | grep -v *.pre.vala`
}


function do_compile {
	set -e
	
	echo ""
	echo ""	
	echo "COMPILING C CODE, CREATING C LIB..."
	gcc -g --shared -fPIC -o librpg.so $(pkg-config --cflags --libs libxml-2.0 sqlite3 gobject-2.0)  *.c
}	


function do_compile_windows {
	set -e
	
	export WIN_PREFIX="/usr/i486-mingw32"
	export PKG_CONFIG_PATH="$WIN_PREFIX/lib/pkgconfig"
	
	echo ""
	echo ""	
	echo "CROSSCOMPILING C CODE TO windows, CREATING C LIB..."
	
	i486-mingw32-gcc -c *.c -L$WIN_PREFIX/bin `pkg-config --define-variable=prefix=$WIN_PREFIX --cflags --libs sqlite3 gobject-2.0 libxml-2.0`

	i486-mingw32-gcc --shared *.o -o librpg.dll -L$WIN_PREFIX/bin `pkg-config --define-variable=prefix=$WIN_PREFIX --cflags --libs sqlite3 gobject-2.0 libxml-2.0`
}

function do_clean  {
	
	rm *.c *.h *.vapi *.o *.so *.dll
	
}


####################
# MAIN 
####################

if [ "$1" == "clean" ]; then

	do_clean

#windows crosscompilation
elif [ "$1" == "windows" ]; then

	do_generate_vala_enums
	do_generate_c_code
	do_compile_windows

else 
	
	do_generate_vala_enums
	do_generate_c_code
	do_compile


fi

echo "DONE!"
