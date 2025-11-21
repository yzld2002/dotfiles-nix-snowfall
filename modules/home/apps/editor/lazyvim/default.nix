{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.editor.lazyvim;
in {
  options.apps.editor.lazyvim= with types; {
    enable = mkBoolOpt false "Enable lazyvim";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      enable = true;
    };
  };
}
