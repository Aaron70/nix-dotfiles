#!/usr/bin/env bash

SPOTIFY="Spotify"
YOUTUBE="Youtube"

# Define options
options="$SPOTIFY\n$YOUTUBE"

# Show wofi menu and capture selection
selection=$(echo -e "$options" | wofi --dmenu --prompt "Select an option:")

# Run corresponding action
case "$selection" in
    "$YOUTUBE")
        firefox --new-window https://youtube.com &
        ;;
    "$SPOTIFY")
        spotify &
        ;;
esac
