#!/bin/bash

#
_paket_find_usage () {
	echo "usage: paket find [options] <paket name>"
}
_paket_find_unknown_option () {
	echo "unknown option '$1'"
	_paket_find_usage
}

_paket_find_normal () {
	pacman --color always -Ss $@
}

#
paket_find () {
	if [ "$1" = "" ]; then
		# print usage
		_paket_find_usage
	else
		local cmd="$1"

		case $cmd in
			-*) {
				#
				_paket_find_unknown_option $cmd
			} ;;

			*) {
				_paket_find_normal $@
			} ;;
		esac
	fi
}

paket_find $@
