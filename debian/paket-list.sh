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
			echo "unknown switch "$switch
			;;
	esac
}