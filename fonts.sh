#!/usr/bin/env bash

fonts="JetBrainsMono FiraCode Hack"
temp_dir=$(mktemp -d)
install_dir="/usr/local/share/fonts/"

# colors
red="\033[1;31m"
green="\033[1;32m"
yellow="\033[1;33m"
blue="\033[1;34m"
nocolor="\033[0m"

alert() {
	log_info="${blue}[*]${nocolor}"
	log_error="${red}[✖]"
	log_warning="${yellow}[!]"
	log_success="${green}[✓]"

	case $1 in
	-e)
		printf "$log_error %s$nocolor\n" "$2"
		;;
	-w)
		printf "$log_warning %s$nocolor\n" "$2"
		;;
	-s)
		printf "$log_success %s$nocolor\n" "$2"
		;;
	*)
		printf "$log_info %s\n" "$1"
		;;
	esac
}

download_fonts() {
	for font in $fonts; do
		alert "Downloading $font.tar.xz"
		curl -fsSL -o "$temp_dir/$font.tar.xz" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/$font.tar.xz"
	done
}

install_fonts() {
	# cat $temp_dir/*.tar.xz | tar -ixvJf - --directory="$install_dir" --wildcards "*.ttf"
	for font in $fonts; do
		alert "Installing $font font..."
		sudo tar -xf "$temp_dir/$font.tar.xz" --directory="$install_dir" --wildcards "*.ttf" --overwrite
	done
}

confirm_install() {
	read -p "Install Nerd Fonts? [Y/N] : " confirm

	case $confirm in
	Y | y | Yes | yes) ;;
	*)
		alert -e "Aborting!"
		exit 0
		;;
	esac
}

main() {
	confirm_install
	download_fonts
	install_fonts

    # rebuild font cache
    fc-cache -f -v
}

main
