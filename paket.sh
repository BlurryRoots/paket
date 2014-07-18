# package utility

# options
paket_arch="debian"

# import sub functions
source $paket_arch"/paket-find.sh"
source $paket_arch"/paket-install.sh"
source $paket_arch"/paket-list.sh"
source $paket_arch"/paket-remove.sh"
source $paket_arch"/paket-sync.sh"
source $paket_arch"/paket-update.sh"

# prints usage
function _packet_usage () {
	echo "usage: paket <cmd> <options>"
}

# main function
function paket () {
	if [ "$1" = "" ]; then
	{
		# if there is no parameter
		# print usage
		_packet_usage
	}
	else
	{
		# pop parameter 1
		local cmd="$1"
		shift

		# switch on command
		case $cmd in
			"ls") {
				paket_list $@
			} ;;

			"find") {
				paket_find $@
			} ;;

			"has") {
				paket_list | grep $@
			} ;;

			"install") {
				paket_install $@
			} ;;

			"remove") {
				paket_remove $@
			} ;;

			"sync") {
				paket_sync $@
			} ;;

			"update") {
				paket_update $@
			} ;;

			*) {
				echo "paket: unknown command!"
				_packet_usage
			} ;;
		esac
	}
	fi
}
