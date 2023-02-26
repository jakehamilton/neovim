{ lib
, pkgs
, neovim-unwrapped
, wrapNeovimUnstable
, neovimUtils
, callPackage
, makeWrapper
, lua51Packages
, ...
}:

let
  all-plugins = callPackage ./plugins.nix { };
  extra-packages = callPackage ./extra-packages.nix { };
  extra-lua-packages = callPackage ./extra-lua-packages.nix { };
  extra-python3-packages = callPackage ./extra-python3-packages.nix { };

  vim-config = callPackage ./vim/config.nix { };
  lua-config = callPackage ./lua/config.nix { };

  extra-make-wrapper-args = ''--suffix PATH : "${lib.makeBinPath extra-packages}"'';
  extra-make-wrapper-lua-args =
    ''--suffix LUA_PATH ";" "${lib.concatMapStringsSep ";" lua51Packages.getLuaPath extra-lua-packages}"'';
  extra-make-wrapper-lua-c-args =
    ''--suffix LUA_CPATH ";" "${lib.concatMapStringsSep ";" lua51Packages.getLuaCPath extra-lua-packages}"'';

  default-plugin = {
    type = "viml";
    plugin = null;
    config = "";
    optional = false;
    runtime = { };
  };

  # Plugins can be either a package or a Neovim plugin attribute set.
  # We need to normalize them such that they are all plugin attribute sets.
  normalized-plugins =
    builtins.map
      (plugin: default-plugin // (if (plugin ? plugin) then plugin else { inherit plugin; }))
      (all-plugins);

  suppress-not-viml-config = plugin:
    if plugin.type != "viml" then
      plugin // { config = ""; }
    else
      plugin;

  custom-rc = ''
    lua <<EOF
      -- Allow imports from common locations for some packages.
      -- This is required for things like lua_ls to work.
      local runtime_path = vim.split(package.path, ";")
      table.insert(runtime_path, "lua/?.lua")
      table.insert(runtime_path, "lua/?/init.lua")
    EOF

    " Custom VIML Config.
    ${vim-config}

    " Custom Lua Config.
    ${lua-config}
  '';

  neovim-config = neovimUtils.makeNeovimConfig {
    viAlias = true;
    vimAlias = true;
    extraPython3Packages = extra-python3-packages;

    withPython3 = true;
    withRuby = true;
    withNodeJs = true;

    plugins = builtins.map suppress-not-viml-config normalized-plugins;
    customRC = custom-rc;
  };

  neovim-config-with-wrapper-args = neovim-config // {
    wrapRc = true;
    wrapperArgs =
      (lib.escapeShellArgs neovim-config.wrapperArgs) + " "
        + extra-make-wrapper-args + " " + extra-make-wrapper-lua-args + " "
        + extra-make-wrapper-lua-c-args;
  };

  wrapped-neovim = wrapNeovimUnstable neovim-unwrapped neovim-config-with-wrapper-args;
in
wrapped-neovim.overrideAttrs (oldAttrs: {
  meta = with lib; {
    description = "Neovim Plus Ultra";
    maintainers = with maintainers; [ jakehamilton ];
    mainProgram = "nvim";
    platforms = with platforms;
      linux
      ++ darwin;
  };
})
