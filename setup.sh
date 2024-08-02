#!bin/bash
distro=$(lsb_release -i -s)
case $distro in
	"Arch"*)
		sudo pacman -S chezmoi alacritty xorg-xrandr neovim git lazygit github-cli pavucontrol discord
		chezmoi init --apply robertjmatson
		;;
	*)
		echo "other"
		;;
esac
