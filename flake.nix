{
  description = "Jake Hamilton's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    snowfall-lib = {
      url = "github:snowfallorg/lib/dev";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall-lib.mkFlake {
      inherit inputs;

      src = ./.;

      channels-config.allowUnfree = true;

      overlay-package-namespace = "plusultra";

      alias.packages.default = "neovim";
    };
}
