{ colors }: 

let 
  background = colors.base00;
  light-background = colors.base01;
  foreground = colors.base05;
in
''
  * {
      font-family: "JetBrainsMono Nerd Font Propo";
      font-weight: bold;
      font-size: 14px;
      min-height: 0;
  }
  
  window#waybar {
      background: transparent;
      /* main window transparent background */
  }
  
  tooltip {
      background: #${background};
      /* tooltip background */
      border: 2px solid #${background};
      /* tooltip border size and color */
      border-radius: 5px;
      /* tooltip rounded corners */
      color: #${foreground}
  }
  
  #submap,
  #custom-launcher,
  #workspaces button,
  #mpris,
  #privacy-item,
  #bluetooth,
  #clock,
  #tray,
  #cpu,
  #memory,
  #backlight,
  #battery,
  #pulseaudio,
  #gamemode,
  #language,
  #network,
  #custom-updates {
      text-shadow: 1px 1px 2px black;
      /* text shadow, offset-x | offset-y | blur-radius | color */
      background: #${background};
      /* background color */
      margin: 10px 4px 4px 4px;
      /* empty spaces around */
      padding: 4px 10px;
      /* extend pill size, vertical then horizontal */
      box-shadow: 1px 1px 2px 1px rgba(0, 0, 0, 0.4);
      /* pill background shadows */
      border-radius: 5px;
      /* rounded corners */
      color: #${foreground};
  }
  
  #custom-updates {
      color: #b4befe;
  }
  
  #network {
      color: #${colors.base0A};
  }
  
  #language {
      color: #74c7ec;
  }
  
  #backlight {
      color: #${colors.base0C};
  }
  
  #pulseaudio {
      color: #${colors.base0D};
  }
  
  #memory {
      color: #${colors.base0E};
  }
  
  #cpu {
      color: #${colors.base0F};
  }
  
  #submap {
      color: #ff9e64;
  }
  
  /* extend empty space on both side of the bar,
   * value from ~/.config/hypr/hyprland.conf
   * gaps_out (8px) + border size (2px) = 10px */
  
  #clock {
      padding-right: 5px;
  }
  
  #privacy-item {
      background: #e64553;
      color: #${foreground};
  }
  
  #tray menu {
      font-weight: bold;
  }
  
  #workspaces {
      padding: 0 3px;
      /* remove padding around workspace module */
  }
  
  #workspaces button {
      padding: 0px 12px 0px 8px;
      /* fit with pill padding, 0px for not haveing duped vertical padding, 4px to make a square (4px value from module padding: ...#clock {padding >>4px<< 10px}) */
      margin-left: 3px;
      border: 1px solid transparent;
      transition-property:
          background-color, border-left-color, border-right-color;
      transition-duration: 0.1s;
      font-size: 10px;
      color: #${foreground};
  }
  
  #workspaces button.empty {
      padding: 0px 10px;
  }
  
  #workspaces button:first-child {
      margin-left: 0;
  }
  
  #workspaces button.active {
      /* active workspace */
      background: #${light-background};
      /* background color */
      /*border-color: #7aa2f7;*/
      /*border-color: #b4befe;*/
      /*color: #a6adc8;*/
      /* icon(text) color */
      /*	color: #${colors.base02};*/
  }
  
  #workspaces button:hover {
      background: #181825;
  }
  
  #battery {
      color: #${colors.base0B};
  }
  
  #battery.warning:not(.charging) {
      color: #fab387;
  }
  
  #battery.critical:not(.charging) {
      color: #f9e2af;
      animation-name: blink;
      animation-duration: 1s;
      animation-timing-function: linear;
      animation-iteration-count: infinite;
      animation-direction: alternate;
  }
  
  @keyframes blink {
      to {
          background-color: #e64553;
      }
  }
''
