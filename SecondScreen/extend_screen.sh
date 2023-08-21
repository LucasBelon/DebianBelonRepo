# changes port to USB for faster connection
adb reverse tcp:5900 tcp:5900 ;

# Generate ModeLines
#gtf 1240 768 30

# Pega o output e joga ali depois do --newmode
# Criar um display virtual:
#cvt 1240 768

# add modelines
xrandr --newmode "1368x800_30.00"  40.44  1368 1376 1512 1656  800 801 804 814  -HSync +Vsync
xrandr --addmode HDMI-1 1368x800_30.00

# creates virtual monitor
xrandr --output HDMI-1 --mode 1368x800_30.00 --right-of eDP-1
# starts VNC viewer to log ing

x11vnc --rfbauth ~/.vnc/passwd -clip 1368x800+1368+0
xrandr -q
