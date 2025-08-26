{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    fzf
    file
    imgcat
    chafa
    ripgrep
    fd
    (writeShellScriptBin "select-fzf" (lib.readFile ./select-fzf.sh))
    (writeShellScriptBin "select-fzf-path" (lib.readFile ./select-fzf-path.sh))
    (writeShellScriptBin "custom-fzf-preview" (lib.readFile ./custom-fzf-preview.sh))
    (writeShellScriptBin "cdfzf" (lib.readFile ./cdfzf.sh))
  ];

  home.shellAliases = {
    cd = ". cdfzf";
  };
}
