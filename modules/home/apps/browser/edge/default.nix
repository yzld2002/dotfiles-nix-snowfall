{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.apps.browser.edge;
in {
  options.apps.browser.edge = with types; {
    enable = mkBoolOpt false "Enable Edge Browser";
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      microsoft-edge
    ];
    home.sessionVariables = { NIXOS_OZONE_WL = "1"; };
  };
}
