sudo cp ~/.config/pacman.conf /etc/pacman.conf

sudo pacman -Syu
sudo pacman -S timeshift
sudo timeshift --create --comments "initial"
sudo pacman -S firefox neovim lua51 luarocks chezmoi tmux git lazygit github-cli samba keepassxc nextcloud-client discord steam

cd ~
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

yay -S alacritty feh nitrogen picom dmenu nfs-utils nfs-utils ranger ttf-jetbrains-mono-nerd
yay -S uwsm ttf-font-awesome man-db pipewire wireplumber xdg-desktop-portal-hyprland qt5-wayland qt6-wayland hyprshot pwvucontrol
yay -S hyprlock hypridle hyprsysteminfo hyprpolkitagent hyprutils hyprland-qtutils hyprpaper waybar
yay -S bluez-utils pipewire-pulse ttf-jetbrains-mono-nerd python bluetui blueman gnome-keyring
yay -S python-pip python-virtualenv python312
yay -S corectrl liquidctl docker nvidia-settings mangohud goverlay neofetch libreoffice-fresh

sudo systemctl start bluetooth.service
sudo systemctl enable bluetooth.service
systemctl enable --user pipewire wireplumber
systemctl --user enable --now hyprpolkitagent.service
systemctl --user enable --now hyprpaper.service

mkdir ~/.config/alacritty/themes
git clone https://github.com/alacritty/alacritty-theme ~/.config/alacritty/themes

chezmoi apply
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
