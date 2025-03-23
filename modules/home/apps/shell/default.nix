{ options, config, lib, pkgs, inputs, ... }:
with lib;
with lib.custom;
let cfg = config.apps.shell;
in {
  options.apps.shell = with types; {
    enable = mkBoolOpt false "Enable zsh and its friends";
  };

  config = mkIf cfg.enable {
    home.sessionVariables = { TERM = "xterm"; };
    programs.zsh = {
      enable = true;
      oh-my-zsh = { enable = true; };
      shellAliases = {
        ls = "eza";
        lz = "lazygit";
        vim = "nvim";
      };
    };

    programs.starship = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.zoxide = {
      enable = true;
      enableZshIntegration = true;
    };

    programs.eza = {
      enable = true;
      enableZshIntegration = true;
    };

  };
}
