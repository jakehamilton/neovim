{ lib
, substituteAll
, symlinkJoin
, nodePackages
, prisma-engines
, makeWrapper
, runCommand
, ...
}:

with lib;
let
  # Usage:
  # mkLuaConfig ./some-file.lua {
  #   MY_ARG = "hello-world";
  # }
  mkLuaConfig = file: args:
    let module =
      substituteAll
        (args // {
          src = file;
        });
    in
    "luafile ${module}";

  # Usage:
  # mkLuaConfigs [
  #   ./some-file.lua
  #   { file = ./some-other.lua; options = { MY_ARG = "hello-world"; }; }
  # ]
  mkLuaConfigs = files:
    lib.concatMapStringsSep "\n"
      (file:
        if builtins.isAttrs file then
          mkLuaConfig file.file file.options
        else
          mkLuaConfig file { }
      )
      files;

  # eslintModules = symlinkJoin {
  #   name = "neovim-eslint-modules";
  #   paths = with nodePackages; [ eslint ];
  # };

  # The ESLint Language Server isn't able to find the eslint library by default, so we have
  # to wrap the executable to set a custom NPM prefix. This will make sure that when it tries
  # to load the package from the global location it is actually directed to ${eslintModules} in
  # the Nix Store.
  # wrappedESLintLanguageServer = runCommand "neovim-wrapped-eslint-language-server"
  #   {
  #     src = nodePackages.vscode-langservers-extracted;
  #     buildInputs = [ makeWrapper ];
  #   }
  #   ''
  #     makeWrapper $src/bin/vscode-eslint-language-server $out/bin/vscode-eslint-language-server \
  #       --set NPM_CONFIG_PREFIX ${eslintModules}
  #   '';
in
mkLuaConfigs [
  ./bufferline.lua
  ./scope.lua
  ./cmp.lua
  ./dashboard.lua
  ./fzf.lua
  ./git.lua
  ./gitsigns.lua
  ./hop.lua
  ./icon-picker.lua
  ./keys.lua
  {
    file = ./lspconfig.lua;
    options = {
      typescript = "${nodePackages.typescript}/lib/node_modules/typescript";
      typescriptLanguageServer = "${nodePackages.typescript-language-server}/bin/typescript-language-server";
      # eslintLanguageServer = "${wrappedESLintLanguageServer}/bin/vscode-eslint-language-server";
      htmlLanguageServer = "${nodePackages.vscode-langservers-extracted}/bin/vscode-html-language-server";
      cssLanguageServer = "${nodePackages.vscode-langservers-extracted}/bin/vscode-css-language-server";
      jsonLanguageServer = "${nodePackages.vscode-langservers-extracted}/bin/vscode-json-language-server";
      dockerLanguageServer = "${nodePackages.dockerfile-language-server-nodejs}/bin/docker-langserver";
      prismaLanguageServer = "${nodePackages.prisma-language-server}/lib/node_modules/@prisma/language-server/dist/src/bin.js";
      prismaFormat = "${prisma-engines}/bin/prisma-fmt";
      tailwindLanguageServer = "${nodePackages.tailwindcss-language-server}/bin/tailwindcss-language-server";
      astroLanguageServer = "${nodePackages.astrojs-language-server}/bin/astro-ls";
    };
  }
  ./lualine.lua
  ./neoscroll.lua
  ./nord.lua
  ./telescope.lua
  ./tmux-navigator.lua
  ./todo-comments.lua
  ./toggleterm.lua
  ./tree-sitter.lua
  ./tree.lua
  ./trouble.lua
  ./twilight.lua
  ./vim.lua
  ./which-key.lua
  ./wrap-toggle.lua
]

