#!bin/bash
echo "Detected Plasma on x11"
sudo pacman -S i3
#create plasma-i3 service
systemctl mask plasma-kwin_x11.service --user
systemctl enable plasma-i3 --user
