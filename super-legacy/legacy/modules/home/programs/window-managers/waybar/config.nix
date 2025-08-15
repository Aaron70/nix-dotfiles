{ colors }:

''
  {
      "layer": "top",
      "height": 40,
      "reload_style_on_change": true,
      "modules-left": [
          "custom/launcher",
          "hyprland/workspaces",
          "mpris",
          "gamemode",
          "privacy",
      ],
      "modules-center": [
          "clock"
      ],
      "modules-right": [
          "hyprland/submap",
          //"tray",
          "cpu",
          "memory",
          "pulseaudio",
          "backlight",
          //"hyprland/language",
          "battery",
          "network",
          "custom/updates",
      ],
      "custom/launcher": {
          //"format": "󰣇",
          "format": "\udb84\udd05", // Nixos loggo
          "on-click": "power-menu"
      },
      "hyprland/submap": {
          "format": "\uf359 {}", // Hyprland logo
          "on-click": "hyprctl dispatch submap reset",
          "max-length": 16,
          "tooltip": false
      },
      "hyprland/workspaces": {
          "format": "<span size='small' font='normal Font Awesome 6 Free'>{icon}</span>",
          "on-click": "activate",
          "sort-by-number": true,
          "on-scroll-up": "hyprctl dispatch workspace e-1",
          "on-scroll-down": "hyprctl dispatch workspace e+1",
          "format-icons": {
              "1": "1",
              "2": "2",
              "3": "3",
              "4": "4",
              "5": "5",
          },
      },
      "mpris": {
          "format": "{player_icon}  {title} - {artist}",
          "format-paused": "{status_icon}  {title} - {artist}",
          "max-length": 50,
          "dynamic-len": 10,
          "player-icons": {
              "default": "󰎈",
              "mpv": "",
              "vlc": "<span color='#E85E00'>󰕼</span>",
              "spotify": "<span color='#1DB954'></span>",
              "brave": "<span font='normal Font Awesome 6 Free' color='#ed7009'></span>",
          },
          "status-icons": {
              "paused": "⏸",
              "playing": "",
              "stopped": "",
          },
      },
      "gamemode": {
          "format": "{glyph}",
          "format-alt": "{glyph} {count}",
          "glyph": "",
          "hide-not-running": true,
          "use-icon": true,
          "icon-name": "input-gaming-symbolic",
          "icon-spacing": 4,
          "icon-size": 20,
          "tooltip": true,
          "tooltip-format": "Games running: {count}",
      },
      "privacy": {
          "icon-spacing": 4,
          "icon-size": 12,
          "transition-duration": 250,
          "modules": [
              {
                  "type": "screenshare",
                  "tooltip": true,
                  "tooltip-icon-size": 12,
              },
              {
                  "type": "audio-in",
                  "tooltip": true,
                  "tooltip-icon-size": 12,
              },
          ],
      },
      "clock": {
          "interval": 1,
          "format": " {:%d.%m.%Y | %H:%M:%S}  ",
          "tooltip-format": "<tt><small>{calendar}</small></tt>",
          "calendar": {
              "mode": "year",
              "weeks-pos": "right",
              "mode-mon-col": 3,
              "on-scroll": 1,
              "format": {
                  "months": "<span color='#${colors.base05}'><b>{}</b></span>",
                  "days": "<span color='#${colors.base08}'><b>{}</b></span>",
                  "weeks": "<span color='#${colors.base0E}'><b>W{}</b></span>",
                  "weekdays": "<span color='#${colors.base0E}'><b>{}</b></span>",
                  "today": "<span color='#${colors.base0F}'><b>{}</b></span>",
              },
          },
          "actions": {
              "on-click-right": "mode",
              "on-click-forward": "tz_up",
              "on-click-backward": "tz_down",
              "on-scroll-up": "shift_up",
              "on-scroll-down": "shift_down",
          },
      },
      "custom/hyprmode": {
        "format": "default"
      },
      "tray": {
          "icon-size": 15,
          "spacing": 10,
      },
      "cpu": {
          "interval": 30,
          "format": " {load}%",
          "max-length": 10,
      },
      "memory": {
          "interval": 30,
          "format": " {}%",
      },
      "battery": {
          // "bat": "hidpp_battery_0",
          "interval": 60,
          "max-length": 25,
          "states": {
              "warning": 30,
              "critical": 15,
          },
          "format": "{icon} {capacity}%",
          "format-full": " 󱟢 {capacity}%",
          "format-icons": {
              "discharging": [
                  "󰁺",
                  "󰁻",
                  "󰁼",
                  "󰁽",
                  "󰁾",
                  "󰁿",
                  "󰂀",
                  "󰂁",
                  "󰂂",
                  "󰁹"
              ],
              "charging": [
                  "󰢜",
                  "󰂆",
                  "󰂇",
                  "󰂈",
                  "󰢝",
                  "󰂉",
                  "󰢞",
                  "󰂊",
                  "󰂋",
                  "󰂅"
              ],
              "plugged": "󱐥",
          },
      },
      "pulseaudio": {
          "format": "{icon} {volume}% {format_source}",
          "format-bluetooth": "{volume}% {icon}",
          "format-muted": "󰖁 0% {format_source}",
          "format-icons": {
              "headphone": "",
              "hands-free": "󰂑",
              "headset": "󰂑",
              "phone": "",
              "portable": "",
              "car": "",
              "default": [
                  "",
                  ""
              ],
          },
          "scroll-step": 5,
          "on-click": "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle",
          "ignored-sinks": [
              "Easy Effects Sink"
          ],
          "format-source": " {volume}%",
          "format-source-muted": " {volume}%",
      },
      "backlight": {
          "format": "{percent}% {icon}",
          "format-icons": [
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              "",
              ""
          ],
      },
      "hyprland/language": {
          "format": "󰌌 {}",
          "format-en": "EN",
          "format-cs": "CZ",
      },
      "network": {
          "format": "{ifname}",
          "format-wifi": "{essid} ({signalStrength}%) {icon}",
          "format-icons": [
              "󰤯",
              "󰤟",
              "󰤢",
              "󰤥",
              "󰤨"
          ],
          //"format-ethernet": "{ipaddr}/{cidr} 󰈀",
          "format-ethernet": " {bandwidthDownBits}  {bandwidthUpBits}",
          "format-disconnected": "Offline 󰲜",
          "tooltip-format": "󰈀 {ifname} via {gwaddr}\n󰩠 {ipaddr}/{cidr}\n󰱦 {bandwidthDownBits}\n󰳘 {bandwidthUpBits}",
          "tooltip-format-wifi": "{icon} {essid} ({signalStrength}%) {ifname}\n󰩠 {ipaddr}/{cidr}\n󰱦 {bandwidthDownBits}\n󰳘 {bandwidthUpBits}",
          "tooltip-format-ethernet": "󰈀 {ipaddr}/{cidr} {ifname}\n󰳘 {bandwidthUpBits}\n󰱦 {bandwidthDownBits}",
          "tooltip-format-disconnected": "Disconnected",
          "max-length": 50,
          "interval": 10
      },
      "custom/updates": {
          "format": "{} {icon}",
          "exec-if": "which waybar-module-pacman-updates",
          "exec": "waybar-module-pacman-updates",
          "return-type": "json",
          "format-icons": {
              "has-updates": "󱍷",
              "updated": "󰂪",
          },
      },
  }
''
