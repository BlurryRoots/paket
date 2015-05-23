#!/bin/bash

#
_paket_install_usage () {
	echo "usage: paket install [options] <package name>"
}

# installs a package from a local package file
_paket_install_local () {
	sudo dpkg -i $@
}

#
_paket_install_remote () {
	sudo apt-get install -V $@
}

# installs a package
paket_install () {
	# check for arguments
	[ $# -eq 0 ] && {
		# if there is no parameter
		# print usage
		_paket_install_usage
	} || {
		# pop parameter 1
		local cmd="$1"
		shift

		# switch on command
		case "$cmd" in
			"--local" | "-l") {
				[ $# -eq 0 ] && {
					_paket_install_usage
					exit 1
				}

				_paket_install_local $@
			} ;;

			"-*") {
				_paket_install_usage
			} ;;

			*) {
				_paket_install_remote "$cmd" $@
			} ;;
		esac
	}
}

paket_install $@
