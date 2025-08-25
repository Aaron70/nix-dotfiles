{ config, ... }:

{
  config = {
    wayland.windowManager.hyprland.settings = {

      "$monitor1" = "DP-5";
      "$monitor2" = "HDMI-A-1";
      "$monitor3" = "eDP-1";

      bindm = [
        # Mouse bindings
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];

      monitor = [
        "$monitor1, 1920x1080@143.98, 0x0, 1"
        "$monitor2, 2560x1440@74.93, -2560x0, 1"
        "$monitor3, 1920x1080, 0x0, 1"
      ];

      input = {
        touchpad = {
          natural_scroll = config.profile.devices.touchpad.naturalScroll;
          scroll_factor = config.profile.devices.touchpad.scrollFactor;
        };
        sensitivity = config.profile.devices.mouse.sensitivity;
      };
    };
  };
}
