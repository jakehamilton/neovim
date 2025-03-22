{ helpers, pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [ nui-nvim ];

  plugins.noice = {
    enable = true;

    settings = {
      presets = {
        command_palette = true;
        inc_rename = true;
        lsp_doc_border = true;
        long_message_to_split = true;
      };

      views = {
        popupmenu = {
          backend = "cmp";
        };
      };

      notify = {
        enabled = true;
      };

      messages = {
        enabled = true;
      };

      lsp = {
        message = {
          enabled = true;
        };

        progress = {
          enabled = false;
          view = "mini";
        };
      };

      popupmenu = {
        enabled = true;
        backend = "nui";
      };

      cmdline = {
        enabled = true;

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
          input = { };
        };
      };

      format = {
        filter = {
          pattern = [
            ":%s*%%s*s:%s*"
            ":%s*%%s*s!%s*"
            ":%s*%%s*s/%s*"
            "%s*s:%s*"
            ":%s*s!%s*"
            ":%s*s/%s*"
          ];
          icon = "";
          lang = "regex";
        };
        replace = {
          pattern = [
            ":%s*%%s*s:%w*:%s*"
            ":%s*%%s*s!%w*!%s*"
            ":%s*%%s*s/%w*/%s*"
            "%s*s:%w*:%s*"
            ":%s*s!%w*!%s*"
            ":%s*s/%w*/%s*"
          ];
          icon = "󱞪";
          lang = "regex";
        };
      };

      routes = [
        {
          filter = {
            event = "msg_show";
            any = [
              { find = "%d+L, %d+B"; }
              { find = "; after #%d+"; }
              { find = "; before #%d+"; }
              { find = "%d fewer lines"; }
              { find = "%d more lines"; }
            ];
          };
          opts = {
            skip = true;
          };
        }

        {
          filter = {
            event = "msg_show";
            any = [
              { find = "Vim:E220"; }
              { find = "Error detected while processing TextChangedI Autocommands"; }
            ];
          };
          opts = {
            skip = true;
          };
        }

        {
          filter = {
            event = "msg_show";
            kind = "emsg";
            any = [
              { find = "E486:"; }
              { find = "e944"; }
            ];
          };
          opts = {
            skip = true;
          };
        }

        {
          filter = {
            event = "notify";
            any = [
              { find = "LSP client log is large"; }
              { find = " was properly created"; }
              { find = " was properly removed"; }
            ];
          };
          opts = {
            skip = true;
          };
        }

        {
          filter = {
            event = "notify";
            kind = "error";
            any = [
              { find = "AST is null on this unit"; }
            ];
          };
          opts = {
            skip = true;
          };
        }

        {
          filter = {
            event = "notify";
            kind = "warn";
            any = [
              { find = "No results for "; }
            ];
          };
          opts = {
            skip = true;
          };
        }

        {
          filter = {
            event = "notify";
            kind = "warn";
            any = [
              { find = "There were issues reported with your "; }
            ];
          };
        }

        {
          view = "cmdline_popup";
          filter = {
            event = "msg_show";
            kind = "echo";
            blocking = true;
            find = "Hop pattern";
          };
          opts = {
            skip = true;
          };
        }

        {
          view = "split";
          filter = {
            event = "msg_show";
            min_height = 20;
          };
        }

        {
          view = "split";
          filter = {
            event = "noice";
            kind = "debug";
          };
        }
      ];
    };
  };
}
