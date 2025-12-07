{ mylib, lib, config, ... }: 
with mylib; with lib;
{ 
  imports = [
    (mkModule { 
      path = [ "modules" ];  
      name = "video-graphics"; 
      options = {
        videoDrivers = mkOption {
          type = types.listOf types.str;
          description = "The list of video drivers' names";
          default = [ "nvidia" ]; # amd driver -> "amdgpu"
        };
      };
      commonConfig = {};
      nixosConfig = { cfg, ... }: {
        services.xserver.videoDrivers = cfg.videoDrivers;
        hardware = {
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
      homeConfig = {};
    })
  ];
}
