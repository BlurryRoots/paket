#!/bin/bash

# usage message
_paket_has_usage () {
	echo "paket has <package-name>"
}

_paket_has_installed () {
	pacman --color always -Qs $@
}

# search for packages containing the given keyword
paket_list () {
	local switch=${1:-"-a"}

	case $switch in
		"-*") {
			_paket_has_usage
		} ;;

		*) {
			_paket_has_installed $@
		} ;;
	esac
}

paket_list $@
