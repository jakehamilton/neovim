{
  lib,
  pkgs,
  ...
}:
with lib.plusultra; {
  extraPlugins = with pkgs.vimPlugins; [
    twilight-nvim
  ];

  extraConfigLua = ''
    require("twilight").setup({})

    require("which-key").register({
      t = {
        name = "Toggle",
        T = { "<cmd>Twilight<cr>", "Toggle twilight" }
      },
    }, { mode = "n", prefix = "<leader>", silent = true })
  '';
}
