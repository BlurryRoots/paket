#!/bin/bash

# print usage message for update function
_paket_update_usage () {
	echo "usage: paket update"
	echo "\t-n | --normal -- normal (default)"
	echo "\t-a | --all -- distribution update"
}

# checks for updates for install packages
paket_update () {
	# set the flag to normal if none is given
	local cmd=${1:-"-n"}

	# check for arguments
	[ $# -ne 0 ] && {
		shift
	}

	# switch on command
	case "$cmd" in
		"--all" | "-a") {
			sudo pacman --color always -Su
		} ;;

		"--normal" | "-n") {
			sudo pacman --color always -Su
		} ;;

		"-*") {
			echo "unkown switch!"
			_paket_update_usage
		} ;;

		*) {
			_paket_update_usage
		} ;;
	esac
}

paket_update $@
