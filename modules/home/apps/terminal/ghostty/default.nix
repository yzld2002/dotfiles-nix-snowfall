{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.terminal.ghostty;
in {
  options.apps.terminal.ghostty = with types; {
    enable = mkBoolOpt false "Enable Ghostty terminal";
  };

  config = mkIf cfg.enable {
    programs = {
      ghostty = {
        enable = true;
        enableZshIntegration = true;
        settings = {
          theme = "Catppuccin Mocha";
          font-family = "CaskaydiaCove Nerd Font Mono";
          font-size = 12;
          keybind = [
            "cmd+t=unbind"
            "cmd+n=unbind"
            "cmd+c=unbind"
            "cmd+w=unbind"
            "cmd+opt+left=unbind"
            "cmd+opt+right=unbind"
          ];
        };
      };
    };
  };
}
