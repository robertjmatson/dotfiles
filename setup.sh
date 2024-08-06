#!bin/bash
distro=$(lsb_release -i -s)
case $distro in
	"Arch"*)
		sudo pacman -S chezmoi alacritty xorg-xrandr neovim git lazygit github-cli pavucontrol discord lua51 timeshift nfs-utils samba net-tools keepassxc sysstat
		chezmoi init --apply robertjmatson
		timedatectl set-timezone America/Chicago
		git clone https://github.com/vivien/i3blocks-contrib.git ~/.config/i3blocks/scripts	
		;;
	*)
		echo "other"
		;;
esac
