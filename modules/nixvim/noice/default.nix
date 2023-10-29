{lib, ...}:
with lib.plusultra;
with lib.plusultra.theme.nord; {
  highlight = {
    NormalFloat = {
      fg = nord6;
      bg = nord0;
    };
    FloatBorder = {
      fg = nord6;
      bg = nord0;
    };

    NoiceCmdlinePopupBorderSearch = {
      fg = nord10;
    };
    NoiceCmdlineIconSearch = {
      fg = nord10;
    };

    NoicePopupMenu = {
      fg = nord6;
      bg = nord0;
    };
    NoicePopupMenuBorder = {
      fg = nord6;
      bg = nord0;
    };
  };

  plugins = {
    noice = {
      enable = true;

      presets = {
        command_palette = true;
        inc_rename = true;
        lsp_doc_border = true;
        long_message_to_split = true;
      };

      cmdline = {
        format = {
          cmdline = {
            pattern = "^:";
            icon = "";
            lang = "vim";
          };
          search_down = {
            kind = "search";
            pattern = "^/";
            icon = " ";
            lang = "regex";
          };
          search_up = {
            kind = "search";
            pattern = "^%?";
            icon = " ";
            lang = "regex";
          };
          shell = {
            pattern = "^:!";
            icon = "";
            lang = "bash";
          };
          filter = {
            pattern = "^:%s!%s+";
            icon = "";
            lang = "bash";
          };
          lua = {
            pattern = "^:%s*lua%s+";
            icon = "";
            lang = "lua";
          };
          help = {
            pattern = "^:%s*he?l?p?%s+";
            icon = "";
          };
          open = {
            pattern = "^:%s*e%s+";
            icon = "";
          };
          input = {};
        };
      };

      routes = [
        # Hide no info
        {
          filter = {find = "No information available";};
          opts = {stop = true;};
        }

        # Hide unhelpful LSP info
        {
          filter = {
            event = "lsp";
            kind = "progress";
            cond = lua.mkRaw ''
              function(message)
                local client = vim.tbl_get(message.opts, "progress", "client")
                return client == "lua_ls" or client == "null-ls" -- skip lua-ls and null-ls progress
              end
            '';
          };
          opts = {skip = true;};
        }

        # Hide unnecessary messages
        {
          filter = {
            event = "msg_show";
            any = [
              {find = "%d+L, %d+B";}
              {find = "; after #%d+";}
              {find = "; before #%d+";}
              {find = "%d fewer lines";}
              {find = "%d more lines";}
            ];
          };
          opts = {skip = true;};
        }
      ];
    };
  };
}
