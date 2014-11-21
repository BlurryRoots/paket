#!/bin/bash

# usage message for list function
_paket_inspect_usage () {
	echo "usage: paket inspect [options] <package name>"
	echo "\t-f -- lists files installed by package"
	echo "\t-s -- prints status for package"
	echo "\t-r -- show dependencies of package"
	echo "\t-R -- show reverse dependencies of package"
}

# search
_paket_inspect_search () {
	dpkg -p $@ || {
		echo "paket: searching for $@ ..."
		dpkg -S $@
	}
}

# search for packages containing the given keyword
paket_inspect () {
	[ $# -eq 0 ] && {
		_paket_inspect_usage
	} || [ $# -eq 1 ] && {
		_paket_inspect_search $@
	} || {
		while getopts f:s:r:R: option; do
			case "$option" in
				f) {
					dpkg-query -L $OPTARG
				} ;;

				s) {
					_paket_inspect_search $OPTARG
				} ;;

				r) {
					apt-rdepends $OPTARG
				} ;;

				R) {
					apt-rdepends -r $OPTARG
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
