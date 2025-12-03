{ mylib, lib, config, ... }: 
with mylib; with lib;
let
  options = {
    videoDrivers = mkOption {
      type = types.listOf types.str;
      description = "The list of video drivers' names";
      default = [ "nvidia" ]; # amd driver -> "amdgpu"
    };
  };
  nixosConfig = { cfg, ... }: {
    services.xserver.videoDrivers = cfg.videoDrivers;
    hardware = {
    # TODO: Uncomment this and check if the everything is working as expected
    # hardware = mkIf (builtins.elem "nvidia" config.services.xserver.videoDrivers) {
      graphics = {
        enable = true;
        enable32Bit = true;
      };
      nvidia = {
        # Enable modesetting for Wayland compositors (hyprland)
        modesetting.enable = true;
        # Use the open source version of the kernel module (for driver 515.43.04+)
        open = true;
        # Enable the Nvidia settings menu
        nvidiaSettings = true;
        # Select the appropriate driver version for your specific GPU
        package = config.boot.kernelPackages.nvidiaPackages.stable;
      };
    };
  };
  homeConfig = { ... }: {};
in
{ imports = [(mkModule { path = [ "modules" ]; name = "video-graphics"; inherit nixosConfig homeConfig options; })]; }
