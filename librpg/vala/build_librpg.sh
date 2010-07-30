 #!/bin/bash

set -e


echo "GENERATING SKILL ENUMs FROM SQLITE DB..."
./gen_enum.sh


echo "

COMPILING VALA TO C CODE..."
valac -C -g -H rpg.h --library=rpg --pkg libxml-2.0 --pkg sqlite3 --basedir=./ `ls *.vala`

echo "

COMPILING C CODE, CREATING C LIB..."
gcc -g --shared -fPIC -o librpg.so $(pkg-config --cflags --libs libxml-2.0 sqlite3 gobject-2.0)  *.c

echo "DONE!"
