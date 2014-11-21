#!/bin/bash

# print usage for remove function
_paket_clean_usage () {
	echo "usage: paket clean"
}

# removes a package
paket_clean () {
	sudo apt-get clean
	sudo apt-get autoremove
	sudo apt-get clean
}

paket_clean $@
