{ ... }:

{
  autocomplete.blink-cmp = {
    enable = true;
    friendly-snippets.enable = true;
    setupOpts = {
      keymap = {
        preset = "default";
        "<CR>" = [ "accept" "fallback" ];
      };
    };
  };
}
