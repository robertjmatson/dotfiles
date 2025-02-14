#!bin/bash
distro=$(lsb_release -i -s)
session=$(echo $XDG_SESSION_TYPE)
desk_env=$(echo $DESKTOP_SESSION)
case $distro in
	"Arch"*)
		source ./.setup/arch/setup.sh
		;;
	*)
		echo "Linux Distro Not Configured in Setup Script"
		;;
esac
