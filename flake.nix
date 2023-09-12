{
  description = "Jake Hamilton's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nixvim = {
      # url = "github:nix-community/nixvim";
      url = "path:/Users/short/work/@jakehamilton/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    snowfall-lib = {
      url = "github:snowfallorg/lib/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;

      snowfall = {
        namespace = "plusultra";
      };

      channels-config.allowUnfree = true;

      alias.packages.default = "neovim";

      outputs-builder = channels: {
        formatter = channels.nixpkgs.alejandra;
      };
    };
}
