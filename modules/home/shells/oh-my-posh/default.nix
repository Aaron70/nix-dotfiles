{ values, ... }:

with values.shells;
{
  programs.oh-my-posh = {
    enable = nushell.enable;

    settings = with builtins; fromJSON (unsafeDiscardStringContext (readFile ./config.json));

    enableBashIntegration = false;
    enableZshIntegration = false;
    enableNushellIntegration = nushell.enable;
  };
}
