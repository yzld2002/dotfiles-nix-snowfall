{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.tools.zellij;
in {
  options.apps.tools.zellij = with types; {
    enable = mkBoolOpt false "Enable zellij";
  };

  config = mkIf cfg.enable {
    programs = {zellij.enable = true;};
  };
}
