#!/bin/bash

# usage message for list function
_paket_list_usage () {
	echo "unknown switch $1"
}

paket_list_installed () {
	dpkg --get-selections\
	| egrep -v "[[:space:]]+deinstall[ ^I]*"\
	| egrep "[[:space:]]+install[ ^I]*"
}

paket_list_details () {
	dpkg-query -W --showformat='${Installed-Size} ${Package} ${Version} ${Status}\n'\
	| grep -v deinstall\
	| sort -n\
	| awk '{print $2"\n\t"$1"\n\t"$3"\n\t"$4}'
}

paket_list_installed_by_size () {
	dpkg-query -W --showformat='${Installed-Size} ${Package} ${Status}\n'\
	| grep -v deinstall\
	| sort -n\
	| awk '{print $1" "$2}'
}

# search for packages containing the given keyword
paket_list () {
	local switch=${1:-"-a"}

	case $switch in
		"--all" | "-a") {
			dpkg --get-selections
		} ;;

		"--install-by-size" | "-s") {
			paket_list_installed_by_size
		} ;;

		"--install" | "-i") {
			paket_list_installed
		} ;;

		"--delete" | "-d") {
			dpkg --get-selections\
			| egrep "[[:space:]]+deinstall[ ^I]*"
		} ;;

		"--verbose" | "-v") {
			paket_list_details
		} ;;

		*) {
			_paket_list_usage $switch
		} ;;
	esac
}

paket_list $@
