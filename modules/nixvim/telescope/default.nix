{
  lib,
  pkgs,
  ...
}:
with lib.plusultra; {
  extraPlugins = with pkgs.vimPlugins; [
    telescope-symbols-nvim
  ];

  extraConfigLua = ''
    do
      local which_key = require("which-key")
      local telescope = require("telescope")
      local api = require("telescope.builtin")

      require('which-key').register({
        f = {
          name = "Find",
          f = { "<cmd>Telescope find_files<cr>", "Find File" },
          F = {
            function()
              api.find_files { hidden = true }
            end,
            "Find File (Hidden)"
          },
          r = { "<cmd>Telescope oldfiles<cr>", "Recent File" },
          g = { "<cmd>Telescope live_grep<cr>", "Grep" },
          G = {
            function()
              api.live_grep { hidden = true }
            end,
            "Grep (Hidden Files)"
          },
          b = { "<cmd>Telescope buffers<cr>", "Find Buffer" },
          n = { "<cmd>Telescope manix<cr>", "Nix Documentation" },
          e = {
            function()
              api.symbols({ sources = { "emoji" } })
            end,
            "Find emoji"
          },
          E = {
            function()
              api.symbols({ sources = { "gitmoji" } })
            end,
            "Find gitmoji"
          },
          i = {
            function()
              api.symbols({ sources = { "nerd" } })
            end,
            "Find icon"
          },
          s = {
            function()
              api.symbols({})
            end,
            "Find symbol"
          },
        },
      }, { mode = "n", prefix = "<leader>", silent = true })
    end
  '';

  plugins = {
    telescope = {
      enable = true;
    };
  };
}
