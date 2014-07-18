paket-install () {
	if [ "$1" = "-l" ]; then
		sudo dpkg -i "$2"
	else
		sudo apt-get install "$1"
	fi	
}