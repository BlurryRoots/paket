#!/bin/bash

# usage message
_paket_option_usage () {
	echo "usage: paket option <key> <value>"
}
# usage message
_paket_option_usage_unknown () {
	echo "paket: unkown key $1"
	_paket_option_usage
}

# switch fancy mode for apt-get
_paket_option_fancy () {
	local value="$1"
	local bit

	case $value in
		"on") {
			#
			bit=1
		};;

		"off") {
			#
			bit=0
		};;
	esac

	# set fancy progress bar
	sudo sh -c "echo 'Dpkg::Progress-Fancy "$bit";' > /etc/apt/apt.conf.d/99progressbar"
}

# call option function
paket_option () {
	[ $# -ne 2 ] && {
		_paket_option_usage
	} || {
		# do stuff
		local key="$1"
		local value="$2"

		case $key in
			"fancy") {
				_paket_option_fancy $value
			} ;;

			*) {
				_paket_option_usage_unknown $key
			} ;;
		esac
	}
}

paket_option $@
