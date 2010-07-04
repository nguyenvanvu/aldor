 #!/bin/bash

set -e
valac -C -H rpg.h --library=rpg --pkg libxml-2.0 --basedir=./ `ls *.vala`
gcc --shared -fPIC -o librpg.so $(pkg-config --cflags --libs libxml-2.0 gobject-2.0)  *.c
