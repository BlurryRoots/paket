#!/bin/bash

# print usage message for sync function
_paket_sync_usage () {
	echo "usage: paket sync"
}

# syncs the package lists
paket_sync () {
	sudo apt-get update
}

paket_sync $@
