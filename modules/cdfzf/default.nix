{ mylib, lib, pkgs, ... }: 
with mylib; with lib;
let
  options = {};
  nixosConfig = { ... }: {}; 
  homeConfig = { ... }: {
    home.packages = with pkgs; [
      fzf
      file
      imgcat
      chafa
      ripgrep
      fd
      (writeShellScriptBin "select-fzf" (lib.readFile ./scripts/select-fzf.sh))
      (writeShellScriptBin "select-fzf-path" (lib.readFile ./scripts/select-fzf-path.sh))
      (writeShellScriptBin "custom-fzf-preview" (lib.readFile ./scripts/custom-fzf-preview.sh))
      (writeShellScriptBin "cdfzf" (lib.readFile ./scripts/cdfzf.sh))
    ];
  
    home.shellAliases = {
      cd = ". cdfzf";
    };
  };
in
{ imports = [(mkModule { enable = true; path = [ "modules" ]; name = "cdfzf"; inherit nixosConfig homeConfig options; })]; }
