#!/bin/bash

# usage message for list function
_paket_list_usage () {
	echo "unknown switch $1"
}

# search for packages containing the given keyword
paket_list () {
	local switch=${1:-"-a"}

	case $switch in
		"-a")
			dpkg --get-selections
			;;
		"-i")
			dpkg --get-selections\
			| egrep -v "[[:space:]]+deinstall[ ^I]*"\
			| egrep "[[:space:]]+install[ ^I]*"
			;;
		"-d")
			dpkg --get-selections\
			| egrep "[[:space:]]+deinstall[ ^I]*"
			;;
		*)
			_paket_list_usage $switch
			;;
	esac
}

paket_list $@
