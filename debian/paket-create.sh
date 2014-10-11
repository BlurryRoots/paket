#!/bin/bash

#
_paket_create_usage () {
	echo "usage: paket create <command>"
	echo "\t installer"
}

# create a simple script that can be used to 'duplicate' a system
paket_create () {
    print '#!/bin/sh'"\n" > apt-copy.sh

    cmd='apt-get install'

    for p in ${(f)"$(aptitude search -F "%p" --disable-columns \~i)"}; {
        cmd="${cmd} ${p}"
    }

    print $cmd "\n" >> apt-copy.sh

    chmod +x apt-copy.sh
}

paket_create $@
