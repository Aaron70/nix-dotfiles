#!/usr/bin/env bash

POWEROFF="Power Off"
RESTART="Restart"
LOGOUT="Log out"
RELOAD="Restart Hyprland"

# Define options
options="$POWEROFF\n$RESTART\n$LOGOUT\n$RELOAD"

# Show wofi menu and capture selection
selection=$(echo -e "$options" | wofi --dmenu --insensitive --prompt "Select an option:")

# Run corresponding action
case "$selection" in
    "$POWEROFF")
        systemctl poweroff
        ;;
    "$RESTART")
        systemctl reboot
        ;;
    "$LOGOUT")
        hyprctl dispatch exit
        ;;
    "$RELOAD")
        hyprctl reload
        ;;
esac
