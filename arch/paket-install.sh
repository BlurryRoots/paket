#!/bin/bash

#
_paket_install_usage () {
	echo "usage: paket install [options] <package name>"
	echo "\t-l | --local -- install package from local file"
}

# installs a package from a local package file
_paket_install_local () {
	sudo pacman --color always -U $@
}

#
_paket_install_remote () {
	sudo pacman --color always -S $@
}

#
_paket_install_user_repositories () {
	yaourt -S $@
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

			"-u") {
				if [ $# -eq 0 ]; then
					_paket_install_usage
					exit 1
				fi

				_paket_install_user_repositories $@
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
