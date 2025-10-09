{ pkgs, ... }: 

{
  imports = [ ../profile.nix ];

  profile.enable = true;
  profile.user.email = "aarongeovanny70@gmail.com";

  profile.withGUI = true;

  profile.terminal.name = "ghostty";
  profile.shell.name = "zsh";
  profile.shell.path = "${pkgs.zsh}/bin/zsh";

  profile.editor.name = "nvim";

  profile.browser.name = "zen";


  profile.variables = {
    development = true;
    stylix = true;
    spotify = true;
  };
}
