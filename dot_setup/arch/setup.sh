#!bin/bash
echo "Configuring Arch"
	sudo cp ~/.config/pacman.conf /etc/pacman.conf	
	sudo systemctl start bluetooth.service
	sudo systemctl enable bluetooth.service

	sudo pacman -Syu
	sudo pacman -S timeshift
	sudo timeshift --create --comments "initial" --tags D
	sudo pacman -S firefox steam discord nextcloud-client
	sudo pacman -S alacritty tmux feh nitrogen picom dmenu
	sudo pacmam -S git lazygit github-cli
	sudo pacman -S samba keepassxc nfs-utils
	sudo pacman -S nfs-utils samba net-tools
	sudo pacman -S neovim lua51 luarocks ranger 
	sudo pacman -S chezmoi
	sudo pacman -S ttf-jetbrains-mono-nerd
	chezmoi init https://github.com/robertjmatson/dotfiles.git

	mkdir ~/.config/alacritty/themes
	git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
	git clone https://github.com/vivien/i3blocks-contrib.git ~/.config/i3blocks/scripts	
	

case $session in
	"x11"*)
		echo "x11 Detected"
		case $desk_env in
			"i3"*)
				source ./x11/i3wm.sh
				;;
			"plasmax11"*)
				source ./.setup/arch/x11/plasma.sh
				;;
			*)
				echo "Desktop Enviornment Not Configured in Setup Script"
				;;
		esac
		;;
	"wayland"*)
		echo "wayland Detected"
		case $desk_env in
			"plasma"*)
				source ./wayland/plasma.sh
				;;
			*)
				echo "Desktop Enviornment Not Configured in Setup Script"
				;;
		esac
		;;
	*)
		echo "Error neither x11 or Wayland Detected"
		;;
esac
	chezmoi apply
