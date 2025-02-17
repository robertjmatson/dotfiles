#!bin/bash
echo "Configuring Arch"
	sudo cp ~/.config/pacman.conf /etc/pacman.conf	
	sudo systemctl start bluetooth.service
	sudo systemctl enable bluetooth.service

	sudo pacman -Syu
	sudo pacman -S timeshift
	sudo timeshift --create --comments "initial"
	#Begin Install
	sudo pacman -S firefox neovim lua51 luarocks chezmoi tmux git lazygit github-cli samba keepassxc nextcloud-client discord steam

	cd ~
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	cd ~

case $session in
	"x11"*)
		echo "x11 Detected"
		sudo pacman -S alacritty feh nitrogen picom dmenu nfs-utils nfs-utils net-tools ranger ttf-jetbrains-mono-nerd
		mkdir ~/.config/alacritty/themes
		git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
		git clone https://github.com/vivien/i3blocks-contrib.git ~/.config/i3blocks/scripts	
	
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
		sudo pacman -S uwsm ttf-font-awesome hypershot 
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
	
