#!/bin/bash

# inspiered by zsh plugin (debian)
# Based On: http://linuxcommando.blogspot.com/2008/08/how-to-show-apt-log-history.html

_paket_history_usage () {
	echo "usage: paket history <command>"
	echo "\tinstall - Lists all packages that have been installed."
	echo "\tupgrade - Lists all packages that have been upgraded."
	echo "\tremove - Lists all packages that have been removed."
	echo "\trollback - Lists rollback information."
	echo "\tlist - Lists all contains of dpkg logs."
}

#
paket_history () {
	local cmd=${1:-"-i"}

	case "$cmd" in
		"--install" | "-i") {
			zgrep --no-filename 'install ' $(ls -rt /var/log/dpkg*)
		} ;;

		"--upgrade" | "-u") {
			zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*)
		} ;;

		"--remove" | "-r") {
			zgrep --no-filename remove $(ls -rt /var/log/dpkg*)
		} ;;

		"--back" | "-b") {
			zgrep --no-filename upgrade $(ls -rt /var/log/dpkg*) | \
				grep "$2" -A10000000 | \
				grep "$3" -B10000000 | \
				awk '{print $4"="$5}'
		} ;;

		"--list" | "-l") {
			zcat $(ls -rt /var/log/dpkg*)
		} ;;

		*) {
			_paket_history_usage
		} ;;
	esac
}

paket_history $@
