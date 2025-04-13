#!/bin/bash

# Check if DP-3 is connected
CONNECTED=$(swaymsg -t get_outputs | jq -r '.[] | select(.name=="DP-3") | .active')

if [ "$CONNECTED" = "true" ]; then
    # ✅ External monitor is connected

    # Set font size smaller in terminal (example for Alacritty)
    sed -i 's/font\.size: .*/font.size: 9/' ~/.config/alacritty/alacritty.yml

    # Reload Alacritty config (if already running)
    pkill -USR1 alacritty

    # Change wallpaper (optional, if using swaybg)
    swaymsg output DP-3 bg ~/Pictures/wallpapers/dual.jpg fill

    # Move workspace 2 to DP-3
    swaymsg workspace 2
    swaymsg move workspace to output DP-3

    # Launch something on DP-3 (optional)
    # swaymsg exec alacritty

else
    # 📴 External monitor is disconnected

    # Reset terminal font size
    sed -i 's/font\.size: .*/font.size: 12/' ~/.config/alacritty/alacritty.yml
    pkill -USR1 alacritty

    # Reset wallpaper
    swaymsg output eDP-1 bg ~/Pictures/wallpapers/solo.jpg fill
fi
