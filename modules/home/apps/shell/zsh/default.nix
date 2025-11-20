{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.shell.zsh;
in {
  options.apps.shell.zsh = with types; {
    enable = mkBoolOpt false "Enable zsh and its friends";
  };

  config = mkIf cfg.enable {
    home.sessionVariables = {
      TERM = "xterm";
      EDITOR = "nvim";
    };
    programs = {
      zsh = {
        enable = true;
        enableCompletion = true;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh = {
          enable = true;
          plugins = ["git"];
        };
        shellAliases = {
          ls = "eza";
          lz = "lazygit";
          vim = "nvim";
        };
      };

      starship = {
        enable = true;
        enableZshIntegration = true;
      };

      zoxide = {
        enable = true;
        enableZshIntegration = true;
      };

      eza = {
        enable = true;
        enableZshIntegration = true;
      };
    };
  };
}
