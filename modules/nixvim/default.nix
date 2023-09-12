{
  lib,
  config,
  pkgs,
  ...
}:
with lib.plusultra;
with theme.nord; {
  config = {
    extraConfigLua = ''
      do
        local which_key = require("which-key")

        local function enable_wrap()
          vim.o.wrap = true
          vim.o.linebreak = true
        end

        local function disable_wrap()
          vim.o.wrap = false
          vim.o.linebreak = false
        end

        local function toggle_wrap()
          if vim.o.wrap then
            disable_wrap()
          else
            enable_wrap()
          end
        end

        which_key.register({
          t = {
            name = "Toggle",
            w = {
              toggle_wrap,
              "Line Wrap"
            },
          },
        }, { mode = "n", prefix = "<leader>", silent = true, noremap = true })
      end
    '';

    maps = {
      normal = vim.mkSilentKeyBinds [
        ["<leader>ch" "<cmd>noh<cr>" "Clear highlight"]
        ["<leader>cs" ''<cmd>let @/=""<cr>'' "Clear search"]
        ["<leader>bd" "<cmd>:BD<cr>" "Delete buffer"]
        ["<leader>bn" "<cmd>:bnext<cr>" "Next buffer"]
        ["<leader>bp" "<cmd>:bprevious<cr>" "Previous buffer"]
      ];
      terminal = {
        "<C-o>" = {
          silent = true;
          action = ''<C-\><C-n>'';
          desc = "Exit terminal mode";
        };
      };
    };

    globals = {
      mapleader = " ";
    };

    options = {
      autoindent = true;
      cursorline = true;
      tabstop = 2;
      shiftwidth = 2;
      wrap = true;
      linebreak = true;

      mouse = "";
      number = true;
      relativenumber = true;
    };

    autoCmd = [
      {
        event = ["BufRead" "BufNewFile"];
        pattern = ["*.txt" "*.md" "*.tex"];
        command = "setlocal spell";
      }
    ];
  };
}
