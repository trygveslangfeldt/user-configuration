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

# Setup locale
ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
hwclock --systohc
sed -i -e 's/^#en_US\.UTF-8/en_US.UTF-8/' -e 's/^#nb_NO\.UTF-8/nb_NO.UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "${hostname_arg}" > /etc/hostname
passwd

# Grub config
pacman -S --noconfirm grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P

# Network
pacman -S --noconfirm openresolv netctl wpa_supplicant dhcpcd dhclient dialog openssh net-tools

#Setup user
useradd -m -G wheel,uucp ${username_arg}
passwd ${username_arg}
pacman -S --noconfirm sudo
sed -i -e 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

# Graphics
pacman -S --noconfirm xorg-xinit lightdm lightdm-gtk-greeter i3lock alacritty
systemctl enable lightdm.service


sed -i -e 's/^#Color/Color/' /etc/pacman.conf

# Audio
pacman -S --noconfirm pavucontrol pulseaudio pulseaudio-alsa
systemctl start --user pulseaudio.service

