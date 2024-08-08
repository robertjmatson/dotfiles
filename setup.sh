#!bin/bash
distro=$(lsb_release -i -s)
case $distro in
	"Arch"*)
		sudo pacman -S xorg-xrandr pavucontrol timeshift sysstat less nano htop arandr xterm base-devel
		sudo pacman -S i3-wm i3blocks i3status i3lock dmenu
		sudo pacman -S nfs-utils samba net-tools keepassxc 
		sudo pacman -S git lazygit github-cli 
		sudo pacman -S bluez bluez-utils
		sudo pacman -S chezmoi alacritty neovim lua51 luarocks ranger tmux
		sudo pacman -S discord firefox steam
		sudo systemctl enable bluetooth.service
		sudo systemctl start bluetooth.service
		chezmoi init --apply robertjmatson
		mkdir ~/.config/alacritty/themes
		git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes
		timedatectl set-timezone America/Chicago
		git clone https://github.com/vivien/i3blocks-contrib.git ~/.config/i3blocks/scripts	
		tmux new-session -d
		tmux source ~/.config/tmux/tmux.conf
		;;
	*)
		echo "other"
		;;
esac
