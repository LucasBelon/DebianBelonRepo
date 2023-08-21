xrandr --output HDMI-1 --off
xrandr -s 0
xrandr --output VIRTUAL1 --off
xrandr --delmode VIRTUAL1 "1240x768_30.00"
xrandr --rmmode "1240x768_30.00"
xrandr --delmode HDMI-1 "1240x768_30.00"
xrandr --rmode "1380x800)30.00"
xrandr --delmode HDMI-1 "1380x800)30.00"
xrandr --rmode "1380x800_30.00"
xrandr --delmode HDMI-1 "1380x800_30.00"

adb kill-server
xrandr -q
