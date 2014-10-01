paket_install () {
	if [ "$1" = "-l" ]; then
		sudo dpkg -i "$2"
	else
		sudo apt-get install -V "$1"
	fi	
}