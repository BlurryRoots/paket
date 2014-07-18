#
function _paket_find_usage () {
	echo "usage: paket find <options> <paket name>"
}
function _paket_find_unknown_option () {
	echo "unknown option '$1'"
	_paket_find_usage
}

#
function paket-find () {
	if [ "$cmd" = "" ]; then
		# print usage
		_paket_find_usage
	else
		local cmd="$1"

		#
		case $cmd in
			"-v") {
				# if this was on option pop it
				shift

				# i have to split this
				p=$(apt-cache search "$1")
				# because of some weird behaviour if you
				# call them together
				g=$(echo "$p" | grep "$1")

				# write to temp file and read it line by line
				# apperantly im to much of a noob to do it in place :/
				echo "$g" > /tmp/paket_find_buffer
				while read line; do
					name=$(echo $line | cut -d" " -f1)
					apt-cache policy $name
				done < /tmp/paket_find_buffer

				rm /tmp/paket_find_buffer
			} ;;

			-*) {
				#
				_paket_find_unknown_option $cmd
			} ;;

			*) {
				#
				apt-cache search "$1" | grep "$1"
			} ;;
		esac
	fi
}
