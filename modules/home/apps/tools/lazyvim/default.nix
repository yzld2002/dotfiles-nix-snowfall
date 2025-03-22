{ options, config, lib, pkgs, inputs, ... }:
with lib;
with lib.custom;
let 
  cfg = config.apps.tools.lazyvim;
in {
  options.apps.tools.lazyvim = with types; {
    enable = mkBoolOpt false "Enable lazyvim";
  };

  config = mkIf cfg.enable { 
    home.packages = [ pkgs.nvim ]; 
  };
}
