{ lib, pkgs, ... }:
let
  values = import ./values.nix;
  user = values.users.default;
in 
{
  imports = [
    <nixos-wsl/modules>
    ../../modules/nixos/programs
    ../../modules/nixos/services
    ../../modules/nixos/source-persisted-configs.nix
  ];

  wsl.enable = true;
  wsl.defaultUser = "nixos";

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
  };

  source-persisted-configs.enable = true; 

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";

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
  nixpkgs.config.allowBroken = true;

  # This env variable is commented because is causing 
  # spotify to freeze and crash Hyprland
  # environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.systemPackages = with pkgs; [
    home-manager
    git
    spotify
  ];
  # ====================|Packages|====================

  system.stateVersion = "24.11";
}
