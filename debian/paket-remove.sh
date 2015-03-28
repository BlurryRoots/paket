#!/bin/bash

# print usage for remove function
_paket_remove_usage () {
	echo "usage: paket remove <package name>"
}

# removes a package
paket_remove () {
	[ $# -eq 0 ] && {
		echo "not enough arguments!"
	} || {
		sudo apt-get autoremove --purge $@
	}
}

paket_remove $@
