{ pkgs, ... }: 

{
  imports = [ ../profile.nix ];

  profile.enable = true;
  profile.user.email = "aaron.vargas@pureinsights.com";

  profile.withGUI = true;

  profile.terminal.name = "ghostty";
  profile.shell.name = "zsh";
  profile.shell.path = "/bin/zsh"; # Uses the default zsh that macos already has installed

  profile.editor.name = "nvim";

  profile.browser.name = "zen";


  profile.variables = {
    development = true;
    stylix = true;
  };
}
