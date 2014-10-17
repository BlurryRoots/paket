#!/bin/bash

# entry point when using paket utility

# prints usage
_paket_usage () {
	echo "usage: paket <cmd> [options] [args]"
}

# main function
paket () {
	# check for arguments
	[ $# -eq 0 ] && {
		# if there is no parameter
		# print usage
		_paket_usage
	} || {
		# pop parameter 1
		local cmd="$1"
		shift

		local shell="$SHELL"
		[ -e $shell ] || [ "$shell" = "" ] && {
			shell=sh
		}

		local subfuncs="$_paket_location/$_paket_arch"
		# switch on command
		case $cmd in
			"ls") {
				$shell "$subfuncs/paket-list.sh" $@
			} ;;

			"find") {
				$shell "$subfuncs/paket-find.sh" $@
			} ;;

			"has") {
				$shell "$subfuncs/paket-list.sh" | grep $@
			} ;;

			"install") {
				$shell "$subfuncs/paket-install.sh" $@
			} ;;

			"remove") {
				$shell "$subfuncs/paket-remove.sh" $@
			} ;;

			"sync") {
				$shell "$subfuncs/paket-sync.sh" $@
			} ;;

			"update") {
				$shell "$subfuncs/paket-update.sh" $@
			} ;;

			"history") {
				$shell "$subfuncs/paket-history.sh" $@
			} ;;

			"inspect") {
				$shell "$subfuncs/paket-inspect.sh" $@
			} ;;

			"option") {
				$shell "$subfuncs/paket-option.sh" $@
			} ;;

			*) {
				echo "paket: unknown command!"
				_packet_usage
			} ;;
		esac
	}
}
