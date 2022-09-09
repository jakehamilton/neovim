{
  description = "Jake Hamilton's Neovim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?rev=478f3cbc8448b5852539d785fbfe9a53304133be";
    unstable.url = "github:nixos/nixpkgs";

    snowfall = {
      url = "github:snowfallorg/lib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    inputs.snowfall.mkFlake {
      inherit inputs;

      src = ./.;

      overlay-package-namespace = "plusultra";

      outputs-builder = channels: {
        packages.default = "neovim";
      };
    };
}
