#!bin/bash
distro=$(lsb_release -i -s)
case $distro in
	"Arch"*)
		sudo systemctl start bluetooth.service
		sudo systemctl enable bluetooth.service

		sudo pacman -Syu
		sudo pacman -S i3
		#create plasma-i3 service
		systemctl mask plasma-kwin_x11.service --user
		systemctl enable plasma-i3 --user
		sudo pacman -S firefox steam discord nextcloud-client
		sudo pacman -S alacritty tmux feh nitrogen picom dmenu
		sudo pacmam -S git lazygit github-cli
		sudo pacman -S samba keepassxc nfs-utils timeshift
		sudo pacman -S nfs-utils samba net-tools
		sudo pacman -S neovim lua51 luarocks ranger 
		sudo pacman -S chezmoi
		sudo pacman -S ttf-jetbrains-mono-nerd bash

		mkdir ~/.config/alacritty/themes
		git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
		git clone https://github.com/vivien/i3blocks-contrib.git ~/.config/i3blocks/scripts	
		;;
	*)
		echo "other"
		;;
esac
