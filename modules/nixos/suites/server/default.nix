{ options, config, lib, pkgs, inputs, ... }:
with lib;
with lib.custom;
let cfg = config.suites.server;
in {
  options.suites.server = with types; {
    enable = mkBoolOpt false "Enable the server suite";
  };

  config = mkIf cfg.enable {
    programs.dconf.enable = true;
    environment.systemPackages = with pkgs; [
      custom.sys
      gnumake
      inputs.agenix.packages.${pkgs.system}.default
      compose2nix
    ];

    system = {
      nix.enable = true;
      locale.enable = true;
      time.enable = true;
    };
    services.ssh.enable = true;
    services.agenix.enable = true;
    # Docker
    virtualisation.docker = {
      enable = true;
      autoPrune.enable = true;
    };
    virtualisation.oci-containers.backend = "docker";
    users.users.yzld2002.extraGroups = [ "docker" ];
  };
}
