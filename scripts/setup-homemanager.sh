#!/bin/bash

set -e

function display_usage() {
	echo "usage: $0 [--hostname=<hostname>] [--username=<username>]"
	exit 1
}

hostname_arg=""
username_arg=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    --hostname=*)
			hostname_arg="${1#*=}"
			;;
    --username=*)
			username_arg="${1#*=}"
			;;
	 *)
		 echo "error: invalid argument format."
		 display_usage
		 ;;
	esac
	shift
done

if [ -z "$hostname_arg" ] || [ -z "${username_arg}" ]; then
	echo "error: missing mandatory argument(s)."
	display_usage
fi
# Variables
NIX_CONF="/etc/nix/nix.conf"

pacman -S --noconfirm nix
gpasswd -a ${username_arg} nix-users

systemctl enable nix-daemon.service
systemctl start nix-daemon.service

nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

# Enable Flakes
echo "Enabling flakes..."
sudo mkdir -p /etc/nix/
echo "experimental-features = nix-command flakes" | sudo tee -a $NIX_CONF

# To build nix
# nix run .#homeConfigurations.TARGET.acticationPackage
