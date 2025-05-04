{ pkgs, ... }:
let
  values = import ./values.nix;
  user = values.users.default;
in 
{
  imports = [ 
    ./hardware-configuration.nix
    ../../modules/nixos/programs
  ];

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    # This must be executed at least once before enable Hyprland
    substituters = ["https://hyprland.cachix.org"];
    trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };

  # ====================|Bootloader|====================
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
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
      extraGroups = [ "networkmanager" "wheel" ];
      packages = [];
    };
  };
  # ====================|Users|====================


  # ====================|Packages|====================
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    home-manager
    git
  ];
  # ====================|Packages|====================


  # ====================|Hardware and Drivers|====================
  hardware = {
    graphics.enable = true;
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  #services.xserver.displayManager.gdm.enable = true;
  #services.xserver.desktopManager.gnome.enable = true;
  # Enables the K Desktop Environment
  #services.xserver.displayManager.sddm.enable = true;
  #services.xserver.desktopManager.plasma5.enable = true;

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Configure keymap in X11
    #services.xserver = {
    #  layout = "us";
    #  xkbVariant = "";
    #};
  # ====================|Hardware and Drivers|====================


  system.stateVersion = "24.11";
}
