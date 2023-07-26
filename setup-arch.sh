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

#ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
#hwclock --systohc
#sed -i -e 's/^#en_US\.UTF-8/en_US.UTF-8/' -e 's/^#ru_RU\.UTF-8/ru_RU.UTF-8/' /etc/locale.gen
#locale-gen
#echo "LANG=en_US.UTF-8" > /etc/locale.conf
#echo "${hostname_arg}" > /etc/hostname
#mkinitcpio -P
#passwd

#pacman -S --noconfirm grub efibootmgr
#grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
#grub-mkconfig -o /boot/grub/grub.cfg

#pacman -S --noconfirm openresolv netctl wpa_supplicant dhcpcd dhclient dialog openssh net-tools

#useradd -m -g wheel -G uucp ${username_arg}
#passwd ${username_arg}
#pacman -S --noconfirm sudo
#sed -i -e 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

#pacman -S --noconfirm nix git
#gpasswd -a ${username_arg} nix-users

#pacman -S --noconfirm xorg-xinit lightdm lightdm-gtk-greater

#mkdir -p /usr/share/xsessions
#echo "[Desktop Entry]" > /usr/share/xsessions/i3.desktop
#echo "Name=i3" >> /usr/share/xsessions/i3.desktop
#echo "Comment=improved dynamic tiling window manager" >> /usr/share/xsessions/i3.desktop
#echo "Exec=/home/${username}/.nix-profile/bin/i3" >> /usr/share/xsessions/i3.desktop
#echo "TryExec=/home/${username}/.nix-profile/bin/i3" >> /usr/share/xsessions/i3.desktop
#echo "Type=Application" >> /usr/share/xsessions/i3.desktop
#echo "X-LightDM-DesktopName=i3" >> /usr/share/xsessions/i3.desktop
#echo "DesktopNames=i3" >> /usr/share/xsessions/i3.desktop
#echo "Keywords=tiling;wm;windowmanager;window;manager;" >> /usr/share/xsessions/i3.desktop
