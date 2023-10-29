{
  lib,
  pkgs,
  ...
}:
with lib.plusultra; {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "tree-sitter-playground";
      version = "unstable-2022-11-26";
      src = pkgs.fetchFromGitHub {
        owner = "nvim-treesitter";
        repo = "playground";
        rev = "1290fdf6f2f0189eb3b4ce8073d3fda6a3658376";
        sha256 = "1yznmc5a32b4bw0c9q0jfkbd77xmi7rmihfr0f44bcgqdxlp8151";
      };
    })
  ];

  maps = {
    normal = vim.mkSilentKeyBinds [
      ["gH" "<cmd>TSHighlightCapturesUnderCursor<cr>" "Show tree-sitter captures"]
      ["<leader>tP" "<cmd>TSPlaygroundToggle<cr>" "Toggle tree-sitter playground"]
    ];
  };
}
