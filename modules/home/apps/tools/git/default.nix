{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.apps.tools.git;
in {
  options.apps.tools.direnv = with types; {
    enable = mkBoolOpt false "Enable Direnv";
  };

  config = mkIf cfg.enable {
    programs = { lazygit.enable = true; };
    programs.git = {
      enable = true;
      diff-so-fancy.enable = true;
      userEmail = "yzld2002@gmail.com";
      userName = "yzld2002";
    };
  };
}
