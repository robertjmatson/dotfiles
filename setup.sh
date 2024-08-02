#!bin/bash
distro=$(lsb_release -i -s)
case $distro in
	"Arch"*)
		sudo pacman -S chezmoi alacritty xorg-xrandr neovim git lazygit github-cli pavucontrol discord lua51 timeshift nfs-utils samba
		chezmoi init --apply robertjmatson
		timedatectl set-timezone America/Chicago
		;;
	*)
		echo "other"
		;;
esac
