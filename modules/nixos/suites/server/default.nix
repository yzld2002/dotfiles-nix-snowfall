{
  options,
  config,
  lib,
  pkgs,
  ...
}:
with lib;
with lib.custom; let
  cfg = config.suites.server;
in {
  options.suites.server = with types; {
    enable = mkBoolOpt false "Enable the server suite";
  };

  config = mkIf cfg.enable {
    system.nix.enable = true;
    system.security.doas.enable = true;

    services.ssh.enable = true;
    programs.dconf.enable = true;

    environment.systemPackages = [pkgs.custom.sys];

    system = {
      locale.enable = true;
      time.enable = true;
    };
  };
}
