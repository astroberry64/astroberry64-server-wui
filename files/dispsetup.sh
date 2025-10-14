#!/bin/sh
# Astroberry display setup - Add custom resolutions via xrandr
# Called by lightdm display-setup-script at X server startup
# Set default resolution from /etc/astroberry-resolution

RESOLUTION="$(cat /etc/astroberry-resolution 2>/dev/null || echo 1920x1080)"

# Wait for X to be ready
sleep 2

# Add custom resolutions with exact names for RustDesk compatibility
# Ignore errors if modes already exist

# 1920x1080@60Hz (Full HD)
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --newmode "1920x1080" 173.00 1920 2048 2248 2576 1080 1083 1088 1120 -hsync +vsync 2>/dev/null
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --addmode HDMI-1 "1920x1080" 2>/dev/null

# 2560x1440@30Hz (2K)
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --newmode "2560x1440" 146.25 2560 2680 2944 3328 1440 1443 1448 1468 -hsync +vsync 2>/dev/null
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --addmode HDMI-1 "2560x1440" 2>/dev/null

# 3840x2160@30Hz (4K)
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --newmode "3840x2160" 296.70 3840 4016 4104 4400 2160 2168 2178 2250 +hsync +vsync 2>/dev/null
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --addmode HDMI-1 "3840x2160" 2>/dev/null

# Set the desired resolution
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --output HDMI-1 --mode "$RESOLUTION" 2>/dev/null || \
DISPLAY=:0 XAUTHORITY=/var/run/lightdm/root/:0 xrandr --fb "$RESOLUTION" 2>/dev/null

exit 0
