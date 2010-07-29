 #!/bin/bash

set -e


echo "GENERATING SKILL ENUMs FROM SQLITE DB..."
./gen_enum.sh


echo "

COMPILING VALA TO C CODE..."
valac -C -H rpg.h --library=rpg --pkg libxml-2.0 --basedir=./ `ls *.vala`

echo "

COMPILING C CODE, CREATING C LIB..."
gcc --shared -fPIC -o librpg.so $(pkg-config --cflags --libs libxml-2.0 gobject-2.0)  *.c

echo "DONE!"
