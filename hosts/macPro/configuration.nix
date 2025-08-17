{ inputs, pkgs, config, ... }:

{
  imports = [  ];

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages =[ ];


  users.users.${config.profile.user.username}.home = /Users/${config.profile.user.username};
  
  # Necessary for using flakes on this system.
  nix.settings.experimental-features = "nix-command flakes";
  
  # Enable alternative shell support in nix-darwin.
  # programs.fish.enable = true;
  
  # Set Git commit hash for darwin-version.
  system.configurationRevision = inputs.self.rev or inputs.self.dirtyRev or null;
  
  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 6;
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
}
