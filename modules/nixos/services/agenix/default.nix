{ config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.services.agenix;
in {
  options.services.agenix = with types; {
    enable = mkBoolOpt false "Enable agenix";
  };

  config = mkIf cfg.enable {
    age = {
      identityPaths = [ "/home/yzld2002/.ssh/id_ed25519" ];
      secrets = {
        vaultwarden.file = ../../../../secrets/vaultwarden.age;
        cloudflare-dns.file = ../../../../secrets/cloudflare-dns.age;
      };
    };
  };
}

