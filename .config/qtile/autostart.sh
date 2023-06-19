#!/bin/sh

# systray battery icon
cbatticon -u 5 &

# systray volume
volumeicon &

# Transparencia
picom &

#Monitor
# List all available outputs and resolutions
#xrandr
# Common setup for a laptop and a monitor
xrandr --output eDP-1 --primary --mode 1920x1080 --pos 0x1080 --output HDMI-1-0 --mode 1920x1080 --pos 0x0

# Fondo de pantalla
feh --bg-scale ~/Imágenes/Wallpapers/09.jpg ~/Imágenes/Wallpapers/09.jpg  &
