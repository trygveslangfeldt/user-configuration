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

ln -sf /usr/share/zoneinfo/Europe/Oslo /etc/localtime
hwclock --systohc
sed -i -e 's/^#en_US\.UTF-8/en_US.UTF-8/' -e 's/^#ru_RU\.UTF-8/ru_RU.UTF-8/' /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "${hostname_arg}" > /etc/hostname
passwd

pacman -S --noconfirm grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
mkinitcpio -P

pacman -S --noconfirm openresolv netctl wpa_supplicant dhcpcd dhclient dialog openssh net-tools

useradd -m -G wheel,uucp ${username_arg}
passwd ${username_arg}
pacman -S --noconfirm sudo
sed -i -e 's/^# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers

pacman -S --noconfirm xorg-xinit lightdm lightdm-gtk-greeter i3lock google-chrome alacritty
systemctl enable lightdm.service

pacman -S --noconfirm nix git
gpasswd -a ${username_arg} nix-users
systemctl enable nix-daemon.service
nix-channel --add https://nixos.org/channels/nixpkgs-unstable
nix-channel --update

sed -i -e 's/^#Color/Color/' /etc/pacman.conf
#makepkg.conf MAKEFLAGS="-j$(nproc)"

#yay
#pacman -S --needed git base-devel
#git clone https://aur.archlinux.org/yay.git
#makepkg -si
#yay google-chrome

pacman -S --noconfirm pavucontrol pulseaudio pulseaudio-alsa

pacman -S --noconfirm telegram-desktop discord

echo "/home/${username_arg}/.nix-profile/bin/zsh" >> /ets/shells
chsh -s /home/${username_arg}/.nix-profile/bin/zsh ${username_arg}

mkdir -p /usr/share/xsessions
cat <<EOF > /usr/share/xsessions/i3.desktop
[Desktop Entry]
Name=i3
Comment=improved dynamic tiling window manager
Exec=/home/msvetkin/.nix-profile/bin/i3-session-target
Type=Application
X-LightDM-DesktopName=i3
DesktopNames=i3
Keywords=tiling;wm;windowmanager;window;manager;
EOF

su - ${username_arg}

systemctl start --user pulseaudio.service

cd ~/
mkdir -p code/github
cd code/github
git clone https://github.com/msvetkin/user-configuration.git
