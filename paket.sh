# package utilities

# import sub functions
source "./paket-find.sh"
source "./paket-install.sh"
source "./paket-list.sh"
source "./paket-remove.sh"
source "./paket-sync.sh"
source "./paket-update.sh"

# prints usage
function _packet-usage () {
	echo "usage: paket <cmd> <options>"
}

# main function
function paket () {
	if [ "$1" = "" ]; then
	{
		# if there is no parameter
		# print usage
		_packet-usage
	}
	else
	{
		# pop parameter 1
		local cmd="$1"
		shift

		# switch on command
		case $cmd in
			"ls") {
				paket-list $@
			} ;;

			"find") {
				paket-find $@
			} ;;

			"has") {
				paket-list | grep $@
			} ;;

			"install") {
				paket-install $@
			} ;;

			"remove") {
				paket-remove $@
			} ;;

			"sync") {
				paket-sync $@
			} ;;

			"update") {
				paket-update $@
			} ;;

			*) {
				echo "paket: unknown command!"
				_packet-usage
			} ;;
		esac
	}
	fi
}
