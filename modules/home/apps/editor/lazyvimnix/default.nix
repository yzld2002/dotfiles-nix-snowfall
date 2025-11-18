{
  config,
  lib,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.apps.editor.lazyvimnix;
in {
  options.apps.editor.lazyvimnix = with types; {
    enable = mkBoolOpt false "Enable lazyvimnix";
  };

  config = mkIf cfg.enable {
    programs.lazyvim = {
      enable = true;
    };
  };
}
