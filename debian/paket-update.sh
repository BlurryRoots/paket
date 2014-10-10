#!/bin/bash

# print usage message for update function
_paket_update_usage () {
	echo "usage: paket update"
}

# checks for updates for install packages
paket_update () {
	sudo apt-get upgrade
}

paket_update $@
