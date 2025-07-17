{ pkgs, config, ... }:
let
  values = import ./values.nix;
  user = values.users.default;
in 
{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/nixos/programs
    ../../modules/nixos/services
    ../../modules/nixos/source-persisted-configs.nix
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  #source-persisted-configs.enable = true; 

  # ====================|Bootloader|====================
  boot.loader.systemd-boot = {
    enable = true;
    # Custom entry for windows in the boot menu
    # windows."Windows" = {
    #   efiDeviceHandle = "FS0";
    #   title = "Windows 11";
    #   sortKey = "0_windows";
    # };
    configurationLimit = 7;
  };
  boot.loader.efi.canTouchEfiVariables = true;
  # ====================|Bootloader|====================


  # ====================|Network Configuration|====================
  networking.hostName = "${user.username}";
  networking.networkmanager.enable = true;
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  # ====================|Network Configuration|====================


  # ====================|Time & Location|====================
  time.timeZone = "America/Costa_Rica";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
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

  
  # ====================|Users|====================
  users.users = {
    "${user.username}" = {
      isNormalUser = true;
      description = user.description;
      extraGroups = [ "networkmanager" "wheel" "audio" "docker" ];
      packages = [];
    };
  };
  # ====================|Users|====================


  # ====================|Packages|====================
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # This env variable is commented because is causing 
  # spotify to freeze and crash Hyprland
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    home-manager
    git
    spotify
    upower
  ];
  # ====================|Packages|====================


  # ====================|Services, Display Managers and DE|====================
  services.xserver.enable = true;
  #services.displayManager.sddm.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio = { 
    enable = false;
  };
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


  # ====================|Hardware|====================
  services.xserver.videoDrivers = [ "nvidia" ];
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


  system.stateVersion = "24.11";
}
