{ options, config, lib, pkgs, inputs, ... }:
with lib;
with lib.custom;
let cfg = config.apps.editor.lazyvim;
in {
  options.apps.shell = with types; {
    enable = mkBoolOpt false "Enable zsh and its friends";
  };

  config = mkIf cfg.enable {

    programs.zoxide.enable = true;

    programs.zsh = {
      enable = true;
      enableCompletion = true;
      shellAliases = {
        ls = "eza";
        lz = "lazygit";
      };
    };

    programs.starship.enable = true;
  };
}
