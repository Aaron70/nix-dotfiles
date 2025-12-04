{ mylib, lib, config, flakeName, ... }: 

with mylib; with lib;
let
  nixAliases = {
    nswitch = "sudo nixos-rebuild switch --flake $HOME/nix-dotfiles#${flakeName}";
    ntest = "sudo nixos-rebuild test --flake $HOME/nix-dotfiles#${flakeName}";
  };
in
{
  imports = [ 
    (mkModule {
      name = "common";
      path = [ "nixos" ];
      options = {};
      homeConfig = {...}: {
        home.shellAliases = nixAliases;
      };
      nixosConfig = { ... }: {
        nix.settings = {
          experimental-features = [ "nix-command" "flakes" ];
        };
        nixpkgs.config.allowUnfree = true;
        nixpkgs.config.allowBroken = false;

        environment.shellAliases = nixAliases;

        dotfiles.modules.systemd-boot.enable = mkDefault true;
        dotfiles.modules.video-graphics.enable = mkDefault true;
        dotfiles.modules.bluetooth.enable = mkDefault true;

        users.users = {
          ${config.dotfiles.profile.user.username} = {
            isNormalUser = true;
            description = config.dotfiles.profile.user.fullname;
            extraGroups = [ "networkmanager" "wheel" "audio" ]; # TODO: "docker" Add the docker group on the docker module
          };
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

        networking.networkmanager.enable = true;
        networking.hostName = config.dotfiles.profile.user.username;
        # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

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

        system.stateVersion = config.dotfiles.profile.version;

    # TODO: Remove this
    # services.xserver.desktopManager.gnome.enable = true;
    # services.xserver.xkb = {
    #   layout = "us";
    #   variant = "";
    # };
     };
    })
  ];
}
