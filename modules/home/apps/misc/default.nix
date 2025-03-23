{ options, config, pkgs, lib, ... }:
with lib;
with lib.custom;
let cfg = config.apps.misc;
in {
  options.apps.misc = with types; {
    enable = mkBoolOpt false "Enable or disable misc apps";
  };

  config = mkIf cfg.enable {
    home.stateVersion = "24.05";
    home.packages = with pkgs; [
      # Development
      git
      git-remote-gcrypt
      fzf
      fd

      # Util
      unzip
      sshfs
      btop
      fastfetch
    ];
  };
}
