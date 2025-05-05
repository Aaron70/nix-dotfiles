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


  # ====================|Services, Display Managers and DE|====================
  security.polkit.enable = true;
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # To use JACK applications
    # jack.enable = true;
  };

  # Added for sway: https://wiki.nixos.org/wiki/Sway
  # kanshi systemd service
  systemd.user.services.kanshi = {
    description = "kanshi daemon";
    environment = {
      WAYLAND_DISPLAY="wayland-1";
      DISPLAY = ":0";
    }; 
    serviceConfig = {
      Type = "simple";
      ExecStart = ''${pkgs.kanshi}/bin/kanshi -c kanshi_config_file'';
    };
  };
  # ====================|Display and DE|====================


  system.stateVersion = "24.11";
}
