#!/bin/bash

# usage message for list function
_paket_inspect_usage () {
	echo "usage: paket inspect [options] <package name>"
	echo "\t-f -- lists files installed by package"
	echo "\t-s -- prints status for package"
}

# search for packages containing the given keyword
paket_inspect () {
	[ $# -eq 0 ] && {
		_paket_inspect_usage
	} || [ $# -eq 1 ] && {
		dpkg -p $@
	} || {
		while getopts fsrR o; do
			shift
			case "$o" in
				f) {
					dpkg-query -L $@
				} ;;

				s) {
					dpkg -p $@
				} ;;

				r) {
					apt-rdepends $@
				} ;;

				R) {
					apt-rdepends -r $@
				} ;;

				*) {
					_paket_inspect_usage
					exit 1
				} ;;
			esac
		done

		#shift $OPTIND-1
	}
}

paket_inspect $@
