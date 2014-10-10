#!/bin/bash

#
_paket_install_usage () {
	echo "usage: paket install [options] <package name>"
}

# installs a package from a local package file
_paket_install_local () {
	local pkg_name="$1"

	sudo dpkg -i "$pkg_name"
}

#
_paket_install_remote () {
	local pkg_name="$1"

	sudo apt-get install -V "$pkg_name"
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
		case "$1" in
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
				local pkg_name="$cmd"

				_paket_install_remote "$pkg_name"
			} ;;
		esac
	}
}

paket_install $@
