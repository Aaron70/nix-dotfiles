{ values, ... }:

{
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  programs = with values; {
    gh.enable = git.enable;
    lazygit.enable = git.enable;
    git = {
      enable = git.enable;
      userName = git.userName;
      userEmail = git.userEmail;
    };
  };
}
