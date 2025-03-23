{ options, config, lib, pkgs, ... }:
with lib;
with lib.custom;
let cfg = config.system.shell;
in {
  options.system.shell = with types; {
    shell = mkOpt (enum [ "zsh" "fish" ]) "zsh" "What shell to use";
  };

  config = {
    environment.systemPackages = with pkgs; [ eza bat zoxide starship ];

    users.defaultUserShell = pkgs.${cfg.shell};
    users.users.root.shell = pkgs.bashInteractive;

    environment.shellAliases = { };
  };
}
