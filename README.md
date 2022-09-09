# ✨ Neovim Plus Ultra ✨

<a href="https://nixos.wiki/wiki/Flakes" target="_blank">
	<img alt="Nix Flakes Ready" src="https://img.shields.io/static/v1?logo=nixos&logoColor=d8dee9&label=Nix%20Flakes&labelColor=5e81ac&message=Ready&color=d8dee9&style=for-the-badge">
</a>
<a href="https://github.com/snowfallorg/lib" target="_blank">
	<img alt="Built With Snowfall" src="https://img.shields.io/static/v1?logoColor=d8dee9&label=Built%20With&labelColor=5e81ac&message=Snowfall&color=d8dee9&style=for-the-badge">
</a>

<p>
<!--
	This paragraph is not empty, it contains an em space (UTF-8 8195) on the next line in order
	to create a gap in the page.
-->
  
</p>

> Customized Neovim, ready for development out of the box.

## Try Without Installing

You can try this configuration out without committing to installing it on your system by running
the following command.

```nix
nix run github:jakehamilton/neovim
```

## Install

### Nix Profile

You can install this package imperatively with the following command.

```nix
nix profile install github:jakehamilton/neovim
```

### Nix Configuration

You can install this package by adding it as an input to your Nix flake.

```nix
{
	description = "My system flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs";

		# Snowfall is not required, but will make configuration easier for you.
		snowfall-lib = {
			url = "github:snowfallorg/lib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		neovim = {
			url = "github:jakehamilton/neovim";
			# This flake currently requires changes that are only on the Unstable channel. 
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = inputs:
		inputs.snowfall-lib.mkFlake {
			inherit inputs;
			src = ./.;

			overlays = with inputs; [
				# Use the overlay provided by this flake. (Requires NixPkgs unstable currently)
				neovim.overlay

				# Or pull the package directly.
				(final: prev: {
					inherit (inputs.neovim.packages.${prev.system}) neovim-plusultra;
				})
			];
		};
}
```

If you've added the overlay from this flake, then in your system configuration
you can add the `neovim-plusultra` package.

```nix
{ pkgs }:

{
	environment.systemPackages = with pkgs; [
		neovim-plusultra
	];
}
```
