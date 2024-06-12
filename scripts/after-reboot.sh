#!/usr/bin/env bash

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

echo "hostname = ${hostname_arg}"
echo "username = ${username_arg}"

# Install Nix

systemctl enable lightdm.service
systemctl start --user pulseaudio.service

mkdir -p /usr/share/xsessions
cat <<EOF > /usr/share/xsessions/i3.desktop
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=/home/${username_arg}/.nix-profile/bin/i3-session-target
Type=Application
X-LightDM-DesktopName=i3
DesktopNames=i3
Keywords=tiling;wm;windowmanager;window;manager;
EOF

