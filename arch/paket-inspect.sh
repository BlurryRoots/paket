#!/bin/bash

# usage message for list function
_paket_inspect_usage () {
	echo "usage: paket inspect [options] <package name>"
	echo "\t-f -- lists files installed by package"
	echo "\t-s -- prints status for package"
	echo "\t-r -- show dependencies of package"
	echo "\t-R -- show reverse dependencies of package"
}

_paket_inspect_basic_command () {
	local cmd=$1; shift
	pacman --color always -Q$cmd $@
}

_paket_inspect_list () {
	_paket_inspect_basic_command l $@
}

_paket_inspect_status () {
	_paket_inspect_basic_command i $@
}

# search for packages containing the given keyword
paket_inspect () {
	local exit_code

	if [ $# -eq 0 ]; then
		exit_code=1
	else
		exit_code=0
		local had_options=0

		while getopts f:s:r:R: option; do
			had_options=1

			if [ $exit_code -eq 1 ]; then
				echo "fuuuuuu!"
				break
			fi

			case "$option" in
				f) {
					_paket_inspect_list $OPTARG
				} ;;

				s) {
					_paket_inspect_status $OPTARG
				} ;;

				r) {
					echo "not yet implemented!"
					exit_code=1
				} ;;

				R) {
					echo "not yet implemented!"
					exit_code=1
				} ;;

				*) {
					echo "unknown option $option"
					exit_code=1
				} ;;
			esac
		done

		if [ $had_options -eq 0 ]; then
			_paket_inspect_status $@
		fi
	fi

	if [ $exit_code -ne 0 ]; then
		_paket_inspect_usage
	fi

	exit $exit_code
}

paket_inspect $@
