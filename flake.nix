{
  description = "";

  inputs = {
    # Core
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    snowfall-lib = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-generators.url = "github:nix-community/nixos-generators";
    nixos-generators.inputs.nixpkgs.follows = "nixpkgs";
    disko.url = "github:nix-community/disko";
    agenix.url = "github:ryantm/agenix";

    nix-darwin.url = "github:LnL7/nix-darwin";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nixcats-nvim-lazyvim-config.url =
      "github:yzld2002/nixcats-nvim-lazyvim-config";
    nixcats-nvim-lazyvim-config.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;
      src = ./.;

      snowfall = {
        meta = {
          name = "dotfiles";
          title = "dotfiles";
        };

        namespace = "custom";
      };

      channels-config = { allowUnfree = true; };

      overlays = with inputs; [ ];

      systems.modules.nixos = with inputs; [
        disko.nixosModules.disko
        agenix.nixosModules.agenix
      ];

      homes.modules = with inputs; [ ];

      templates = import ./templates { };
    };
}
