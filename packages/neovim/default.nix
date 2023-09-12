{
  lib,
  pkgs,
  inputs,
  neovim-settings ? {},
  neovim-config ? {},
  ...
}: let
  raw-modules = lib.snowfall.fs.get-default-nix-files-recursive (lib.snowfall.fs.get-file "/modules/nixvim");

  wrapped-modules =
    builtins.map
    (
      raw-module: args @ {...}: let
        result = import raw-module (args
          // {
            # NOTE: nixvim doesn't allow for these to be customized so we must work around the
            # module system here...
            inherit lib pkgs;
          });
      in
        result
        // {
          _file = raw-module;
        }
    )
    raw-modules;

  raw-neovim = pkgs.nixvim.makeNixvimWithModule {
    module = {
      imports = wrapped-modules;

      config = lib.mkMerge [
        {
          _module.args = {
            settings = neovim-settings;
            lib = lib.mkForce lib;
          };
        }

        neovim-config
      ];
    };
  };

  neovim = raw-neovim.overrideAttrs (attrs: {
    meta =
      attrs.meta
      // {
        # NOTE: The default platforms specified aren't actually all
        # supported by nixvim. Instead, only support the ones that can build with
        # the module system.
        platforms = builtins.attrNames inputs.nixvim.legacyPackages;
      };
  });
in
  neovim
