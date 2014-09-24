#!/bin/bash

# package utility

# options
export _paket_arch="debian"
export _paket_location="$HOME/Workspace/Scripts/paket"

function import_subfuncs () {
	local arch="$1"
	local location="$2"
	# import sub functions
	source "$2/$1/paket-find.sh"
	source "$2/$1/paket-install.sh"
	source "$2/$1/paket-list.sh"
	source "$2/$1/paket-remove.sh"
	source "$2/$1/paket-sync.sh"
	source "$2/$1/paket-update.sh"
}

# prints usage
function _packet_usage () {
	echo "usage: paket <cmd> <options>"
}

# main function
function paket () {
	if [ "$1" = "" ]; then
	{
		# if there is no parameter
		# print usage
		_packet_usage
	}
	else
	{
		# pop parameter 1
		local cmd="$1"
		shift

		# switch on command
		case $cmd in
			"ls") {
				paket_list $@
			} ;;

			"find") {
				paket_find $@
			} ;;

			"has") {
				paket_list | grep $@
			} ;;

			"install") {
				paket_install $@
			} ;;

			"remove") {
				paket_remove $@
			} ;;

			"sync") {
				paket_sync $@
			} ;;

			"update") {
				paket_update $@
			} ;;

			*) {
				echo "paket: unknown command!"
				_packet_usage
			} ;;
		esac
	}
	fi
}

import_subfuncs _paket_arch _paket_location
