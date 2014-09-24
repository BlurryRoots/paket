# package utility

# options
export _paket_arch="debian"
export _paket_location="$HOME/Workspace/Scripts/paket"

function import_subfuncs () {
	local arch="$1"
	local location="$2"

	# import main functions
	source "$2/main.sh"
	# import sub functions
	source "$2/$1/paket-find.sh"
	source "$2/$1/paket-install.sh"
	source "$2/$1/paket-list.sh"
	source "$2/$1/paket-remove.sh"
	source "$2/$1/paket-sync.sh"
	source "$2/$1/paket-update.sh"
}

import_subfuncs "$_paket_arch" "$_paket_location"
