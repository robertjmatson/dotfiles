#!bin/sh
if [ -z "$1" ]; then
	mode="swap"
else
	mode=$1
fi
if [ $mode = "play" ]; then
	echo "switching to play"
	xrandr --delmonitor Virtual-Right
        xrandr --delmonitor Virtual-Left
	xrandr --output DP-4 --primary
elif [ $mode = "work" ]; then
	echo "switching to work"
	if xrandr --listactivemonitors | grep 'Virtual-Left' ; then
		echo "Virtual-Left already created"
	else
		xrandr --setmonitor Virtual-Left 2560/596x1440/340+1080+1080 DP-4
	fi
	if xrandr --listactivemonitors | grep 'Virtual-Right' ; then
		echo "Virtual-Right already created"
	else        
		xrandr --setmonitor Virtual-Right 2560/596x1440/340+3640+1080 none
	fi
else	
	if xrandr --listactivemonitors | grep 'Virtual-Left' ; then
		echo "switching to play"
		xrandr --delmonitor Virtual-Right
		xrandr --delmonitor Virtual-Left
		xrandr --output DP-4 --primary
	else
		echo "switching to work"
		xrandr --setmonitor Virtual-Left 2560/596x1440/340+1080+1080 DP-4
		xrandr --setmonitor Virtual-Right 2560/596x1440/340+3640+1080 none
	fi
fi

