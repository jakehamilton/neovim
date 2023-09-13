{
  lib,
  pkgs,
  ...
}:
with lib.plusultra; {
  extraConfigLua = ''
    require("which-key").register({
      g = {
        name = "Go",
        H = {
          "<cmd>TSHighlightCapturesUnderCursor<cr>", "Show Tree-sitter Captures"
        },
      },
      t = {
        name = "Toggle",
        p = { "<cmd>TSPlaygroundToggle<cr>", "Toggle Tree-sitter Playground" }
      }
    }, { mode = "n", noremap = true, silent = true })
  '';

  plugins = {
    treesitter = {
      enable = true;
    };
  };
}
