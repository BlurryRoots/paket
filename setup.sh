#!/bin/bash

# options
# setup your architecture
export _paket_arch="arch"
# setup the path where paket is located
export _paket_location="$HOME/Workspace/Scripts/paket"

# package utility setup
_paket_setup_usage () {
	echo -e "usage: setup.sh [--no-path | -n]"
	echo -e "\t--no-path | -n - do not append paket/bin to \$PATH"
}

# main procedure
_paket_setup_main () {
	local append_path=1

	while [[ $# > 0 ]]; do
		echo "checking paramter: $1"
		local cmd="$1"
		shift

		# switch on command
		case "$cmd" in
			"--no-path" | "-n") {
				append_path=0
			} ;;

			*) {
				_paket_setup_usage
				exit 1
			} ;;
		esac
	done

	if [ $append_path = 1 ]; then
		export PATH="$PATH:$_paket_location/bin"
	fi
}

_paket_setup_main $@
