{ ... }:
{
  dotfiles.profile.version = "25.11";
  dotfiles.profile.user = {
    username = "aaronv";
    fullname = "Aaron Vargas";
    email = "aarongeovanny70@gmail.com";
  };

  dotfiles.features.desktop-environment.enable = true;
  dotfiles.features.development.enable = true;
  dotfiles.features.gaming.enable = true;

  dotfiles.modules.godot.enable = false;

  dotfiles.modules.spotify.enable = true;
  dotfiles.modules.discord.enable = true;
  dotfiles.modules.zellij.enable = true;

  dotfiles.modules.tmux.extraSearchPaths = "~/personal/dev:3 ~/personal/repos";
}
