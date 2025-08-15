{ ... }: 

{
  imports = [ ../profile.nix ];

  profile.enable = true;
  profile.user.email = "aarongeovanny70@gmail.com";

  profile.withGUI = false;

  profile.terminal.name = "ghostty";
}
