#!/bin/bash

# print usage for remove function
_paket_remove_usage () {
	echo "usage: paket remove <package name>"
}

# removes a package
paket_remove () {
	sudo apt-get autoremove --purge "$1"
}

paket_remove $@
