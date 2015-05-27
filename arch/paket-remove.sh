#!/bin/bash

# print usage for remove function
_paket_remove_usage () {
	echo "usage: paket remove <package name>"
}

_paket_remove_purge () {
	sudo pacman -Rns $@
}

# removes a package
paket_remove () {
	if [ $# -eq 0 ]; then
		echo "not enough arguments!"
		_paket_remove_usage
		return 1
	fi

	_paket_remove_purge $@
}

paket_remove $@
