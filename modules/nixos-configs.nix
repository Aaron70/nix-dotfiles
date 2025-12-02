{ mylib, lib, config, ... }: 

with mylib; with lib;
{
  imports = [ 
    (mkModule {
      name = "common";
      path = [ "nixos" ];
      options = {};
      nixosConfig = { ... }: {
    nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
    };


    # make an option for boot options to enable or disable
    boot.loader.systemd-boot = {
      enable = true;
      configurationLimit = 7;
    };
    boot.loader.efi.canTouchEfiVariables = true;


    environment.sessionVariables = {
      USERNAME = config.dotfiles.profile.user.username;
    };

    # ====================|Users|====================
    users.users = {
      "aaronv" = {
        isNormalUser = true;
        description = "Aaron Vargas";
        extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
        packages = [];
      };
    };
    # ====================|Users|====================

    # ====================|Packages|====================
    nixpkgs.config.allowUnfree = true;
    nixpkgs.config.allowBroken = false;
    # ====================|Packages|====================

    # ====================|Services, Display Managers and DE|====================
    services.xserver.enable = true;
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    services.xserver.xkb = {
      layout = "us";
      variant = "";
    };

    services.printing.enable = true;

    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # To use JACK applications
      # jack.enable = true;
    };
    # ====================|Display and DE|====================

    # ====================|Network Configuration|====================
    networking.hostName = "aaronv";
    networking.networkmanager.enable = true;
    # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    # ====================|Network Configuration|====================

    # ====================|Time & Location|====================
    time.timeZone = mkDefault "America/Costa_Rica";

    # Select internationalisation properties.
    i18n.defaultLocale = mkDefault "en_US.UTF-8";
    i18n.extraLocaleSettings = mkDefault {
      LC_ADDRESS = "es_CR.UTF-8";
      LC_IDENTIFICATION = "es_CR.UTF-8";
      LC_MEASUREMENT = "es_CR.UTF-8";
      LC_MONETARY = "es_CR.UTF-8";
      LC_NAME = "es_CR.UTF-8";
      LC_NUMERIC = "es_CR.UTF-8";
      LC_PAPER = "es_CR.UTF-8";
      LC_TELEPHONE = "es_CR.UTF-8";
      LC_TIME = "es_CR.UTF-8";
    };
    # ====================|Time & Location|====================

    # ====================|Hardware|====================
    services.xserver.videoDrivers = [ "nvidia" ]; # TODO: Probably we should refactor this if you get an amd: driver -> "amdgpu"
    hardware = {
      graphics.enable = true;
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
    # ====================|Hardware|====================

    system.stateVersion = "25.11";
  };
    })
  ];
}
