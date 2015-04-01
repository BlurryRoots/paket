# paket - (yet another) package manager frontend

## Installation

Clone the project e.g.```git clone https://github.com/BlurryRoots/paket.git ~/Workspace/Scripts/paket```.

Open paket/setup.sh and change the architecture and location accordingly. Currently only debian package management tools (apt, apt-get, apt-file, etc.) are supported.

Source the setup script in a configuration file of your choice, e.g. add ```source /path/to/paket/setup.sh``` to your ```.bashrc```. This will export the architecture and path of paket as well. It also will append the path to bin/paket to your $PATH variable. If you prefere to handle the discoverability yourself, by for example soft linking bin/paket to a directory which is already added to $PATH you can pass --no-path or -n to the setup script.

After reloading your config file or restarting your shell, paket should now be available to you.

## Usage

### Basic command syntax:

paket <command\> \[options\] \[paramters\]

### Available commands:

* clean
* create
* find
* history
* inspect
* install
* list
* option
* remove
* repo
* sync
* update

More details coming soon.
