{
  options,
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.tools.direnv;
in {
  options.apps.tools.direnv = with types; {
    enable = mkBoolOpt false "Enable direnv";
  };

  config = mkIf cfg.enable {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
      enableNushellIntegration = true;
    };

    home.sessionVariables.DIRENV_LOG_FORMAT = ""; # Blank so direnv will shut up
  };
}
