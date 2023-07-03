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

## Screenshots

![Standard](https://user-images.githubusercontent.com/7005773/189502030-d8f190d1-1ff9-4244-ba25-c47ffcde887f.png)
![Diagnostics](https://user-images.githubusercontent.com/7005773/189502035-9d09ca7c-82da-4537-8bab-d08d460b439c.png)
![Dashboard](https://user-images.githubusercontent.com/7005773/189502036-64e939c8-1f53-40dc-a781-8cf37ec3d57d.png)

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
		nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
		unstable.url = "github:nixos/nixpkgs/nixos-unstable";

		# Snowfall is not required, but will make configuration easier for you.
		snowfall-lib = {
			url = "github:snowfallorg/lib";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		neovim = {
			url = "github:jakehamilton/neovim";
			# This flake currently requires changes that are only on the Unstable channel.
			inputs.nixpkgs.follows = "nixpkgs";
			inputs.unstable.follows = "unstable";
		};
	};

	outputs = inputs:
		inputs.snowfall-lib.mkFlake {
			inherit inputs;
			src = ./.;

			overlays = with inputs; [
				# Use the overlay provided by this flake.
				neovim.overlays.default

				# There is also a named overlay, though the output is the same.
				neovim.overlays."package/neovim"
			];
		};
}
```

If you've added the overlay from this flake, then in your system configuration
you can add the `plusultra.neovim` package.

```nix
{ pkgs }:

{
	environment.systemPackages = with pkgs; [
		plusultra.neovim
	];
}
```
