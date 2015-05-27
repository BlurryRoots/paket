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

_paket_find_user_repository () {
	which yaourt > /dev/null
	if (($? != 0)); then
		echo "error: could not find dependency! (yaourt)"
		return 1
	fi

	yaourt -Ss $@
}

#
paket_find () {
	if [ "$1" = "" ]; then
		# print usage
		_paket_find_usage
	else
		local cmd="$1"

		case $cmd in
			"-u") {
				shift
				_paket_find_user_repository $@
			} ;;

			"-*") {
				#
				_paket_find_unknown_option $cmd
			} ;;

			"*") {
				_paket_find_normal $@
			} ;;
		esac
	fi
}

paket_find $@
