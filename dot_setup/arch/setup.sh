#!bin/bash
echo "Configuring Arch"
	sudo cp ~/.config/pacman.conf /etc/pacman.conf	

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
		sudo pacman -S uwsm ttf-font-awesome man-db pipewire wireplumber xdg-desktop-portal-hyprland qt5-wayland qt6-wayland 
		yay -S hyprshot pwvucontrol hyprlock hypridle hyprsysteminfo hyprpolkitagent hyprutils hyprland-qtutils hyprpaper
		yay -S bluez-utils pipewire-pulse ttf-jetbrains-mono-nerd python	
		yay -S bluetui blueman
		yay -S gnome-keyring	
		sudo systemctl start bluetooth.service
		sudo systemctl enable bluetooth.service
		systemctl enable --user pipewire wireplumber
		systemctl --user enable --now hyprpolkitagent.service
		systemctl --user enable --now hyprpaper.service
		case $desk_env in
			"plasma"*)
				source ./wayland/plasma.sh
				;;
			"hyprland"*
				sudo pacman -S waybar
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
	yay -S python-pip python-virtualenv
	yay -S python312
  yay -S corectrl liquidctl docker nvidia-settings mangohud goverlay neofetch libreoffice-fresh
	chezmoi apply
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
