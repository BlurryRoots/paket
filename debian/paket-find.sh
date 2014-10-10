#!/bin/bash

#
_paket_find_usage () {
	echo "usage: paket find <options> <paket name>"
}
_paket_find_unknown_option () {
	echo "unknown option '$1'"
	_paket_find_usage
}

#
_paket_find_orify () {
	echo $1 | sed -e 's/ /\\\|/g'
}

_paket_find_normal () {
	#
	apt-cache search $@ | grep -i `echo "$@" | sed -e 's/ /\\\|/g'`
}

_paket_find_print_pkg_detail () {
	apt-cache policy $1
	echo ""
}

_paket_find_print_pkg_location () {
	echo -e "${green}${1}${rcol}"
	apt-cache madison $1
	echo ""	
}

_paket_find_verbose () {
		local green='\e[0;32m'
		local rcol='\e[0m'
		#local bold=`tput smso`
		#local offbold=`tput rmso`

		# write to temp file and read it line by line
		# apperantly im to much of a noob to do it in place :/
		#apt-cache search $@ | grep -i `echo "$@" | sed -e 's/ /\\\|/g'` > /tmp/paket_find_buffer
		_paket_find_normal $@ > /tmp/paket_find_buffer
		while read line; do
			name=$(echo $line | cut -d" " -f1)
			_paket_find_print_pkg_detail $name
		done < /tmp/paket_find_buffer

		rm /tmp/paket_find_buffer	
}

#
paket_find () {
	if [ "$1" = "" ]; then
		# print usage
		_paket_find_usage
	else
		local cmd="$1"

		#
		case $cmd in
			"-v") {
				# pop the verbose option
				shift

				_paket_find_verbose $@
			} ;;

			-*) {
				#
				_paket_find_unknown_option $cmd
			} ;;

			*) {
				_paket_find_normal $@
			} ;;
		esac
	fi
}

paket_find $@
