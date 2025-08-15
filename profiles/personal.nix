{ ... }:

{
  import = [ ./profile.nix ];


  profile.enable = true;
  profile.user.email = "aarongeovanny70@gmail.com";

  # Features
  features.development.enable = true;
}
