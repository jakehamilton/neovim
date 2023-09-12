{
  lib,
  pkgs,
  ...
}:
with lib.plusultra;
with lib.plusultra.theme.nord; {
  config = {
    extraPlugins = with pkgs.vimPlugins; [
      # nvim-navic
      neodev-nvim
    ];

    extraConfigLuaPre = ''
      require("neodev").setup {
        lspconfig = true,
        library = {
          enabled = true,
          plugins = true,
          runtime = true,
          types = true,
        },
      }

      -- require("nvim-navic").setup {
      --   icons = {
      --     File          = "󰈙 ",
      --     Module        = " ",
      --     Namespace     = "󰌗 ",
      --     Package       = " ",
      --     Class         = "󰌗 ",
      --     Method        = "󰆧 ",
      --     Property      = " ",
      --     Field         = " ",
      --     Constructor   = " ",
      --     Enum          = "󰕘",
      --     Interface     = "󰕘",
      --     Function      = "󰊕 ",
      --     Variable      = "󰆧 ",
      --     Constant      = "󰏿 ",
      --     String        = "󰀬 ",
      --     Number        = "󰎠 ",
      --     Boolean       = "◩ ",
      --     Array         = "󰅪 ",
      --     Object        = "󰅩 ",
      --     Key           = "󰌋 ",
      --     Null          = "󰟢 ",
      --     EnumMember    = " ",
      --     Struct        = "󰌗 ",
      --     Event         = " ",
      --     Operator      = "󰆕 ",
      --     TypeParameter = "󰊄 ",
      --   },
      --   lsp = {
      --     auto_attach = true,
      --   },
      --   highlight = false,
      --   separator = " ⇢ ",
      --   depth_limit = 0,
      --   depth_limit_indicator = "..",
      --   safe_output = true
      -- }
    '';

    extraConfigLua = ''
    '';

    options = {
      laststatus = 3;
    };

    highlight = {
      StatusLine = {
        bg = nord0;
      };

      lualine_b_windows_active = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_windows_inactive = {
        fg = nord6;
        bg = nord1;
      };
      lualine_b_diff_modified_terminal = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_modified_inactive = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_removed_terminal = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_removed_inactive = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_modified_replace = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_modified_command = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_removed_replace = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_removed_command = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_modified_visual = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_modified_normal = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_modified_insert = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_removed_visual = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_removed_normal = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_removed_insert = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_added_terminal = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_added_inactive = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_added_replace = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_added_command = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_added_visual = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_added_normal = {
        fg = nord6;
        bg = nord10;
      };
      lualine_b_diff_added_insert = {
        fg = nord6;
        bg = nord10;
      };
    };

    plugins = {
      # lsp = {
      #   onAttach = ''
      #     if client.server_capabilities.documentSymbolProvider then
      #       require("nvim-navic").attach(client, bufnr)
      #     end
      #   '';
      # };

      lualine = {
        enable = true;

        globalstatus = true;

        disabledFiletypes = {
          statusline = ["dashboard"];
          winbar = ["dashboard"];
        };

        theme = {
          normal = {
            a = {
              fg = nord2;
              bg = nord6;
              gui = "bold";
            };
            b.bg = nord10;
            c.bg = nord0;
            x.bg = nord0;
            y.bg = nord0;
            z = {
              fg = nord6;
              bg = nord10;
            };
          };
          insert = {
            a = {
              fg = nord10;
              bg = nord6;
              gui = "bold";
            };
            b.bg = nord10;
            c.bg = nord0;
            x.bg = nord0;
            y.bg = nord0;
            z = {
              fg = nord6;
              bg = nord10;
            };
          };
          visual = {
            a = {
              fg = nord15;
              bg = nord6;
              gui = "bold";
            };
            b.bg = nord10;
            c.bg = nord0;
            x.bg = nord0;
            y.bg = nord0;
            z = {
              fg = nord6;
              bg = nord10;
            };
          };
          replace = {
            a = {
              fg = nord12;
              bg = nord6;
              gui = "bold";
            };
            b.bg = nord10;
            c.bg = nord0;
            x.bg = nord0;
            y.bg = nord0;
            z = {
              fg = nord6;
              bg = nord10;
            };
          };
          inactive = {
            a = {
              fg = nord10;
              bg = nord6;
              gui = "bold";
            };
            b.bg = nord10;
            c.bg = nord0;
            x.bg = nord0;
            y.bg = nord0;
            z = {
              fg = nord6;
              bg = nord10;
            };
          };
        };

        componentSeparators = {
          left = "⋮";
          right = "⋮";
        };
        sectionSeparators = {
          left = "";
          right = "";
        };

        sections = {
          lualine_a = [
            {
              name = lua.mkRaw ''
                function()
                  return ""
                end
              '';
            }
          ];
          lualine_b = [
            {
              name = "branch";
              icon = "";
            }
            {name = "diff";}
          ];
          lualine_c = [""];
          lualine_x = [
            {
              name = "diagnostics";
              extraConfig = {update_in_insert = false;};
            }
          ];
          lualine_y = [""];
          lualine_z = [
            {name = "%l:%c";}
            {
              name = "fileformat";
              extraConfig = {icon_only = true;};
            }
          ];
        };

        tabline = {
          lualine_a = [""];
          lualine_b = [""];
          lualine_c = [
            {
              name = "windows";
              extraConfig = {
                symbols = {
                  modified = "";
                  readonly = "";
                  unnamed = " ";
                  newfile = " ";
                };

                windows_color = {
                  active = {
                    fg = nord6;
                    bg = nord10;
                  };
                  inactive = {
                    fg = nord6;
                    bg = nord1;
                  };
                };
              };

              separator = {
                right = "";
              };
            }
          ];
          lualine_x = [""];
          lualine_y = [""];
          lualine_z = [
            {
              name = "tabs";

              extraConfig = {
                tabs_color = {
                  active = {
                    fg = nord6;
                    bg = nord10;
                  };
                  inactive = {
                    fg = nord6;
                    bg = nord1;
                  };
                };
              };
              separator = {
                left = "";
              };
            }
          ];
        };

        winbar = {
          lualine_a = [""];
          lualine_b = [""];
          lualine_c = [
            ""
            # {
            #   name = lua.mkRaw ''
            #     require('nvim-navic').get_location
            #   '';
            #   extraConfig = {
            #     cond = lua.mkRaw ''
            #       require('nvim-navic').is_available
            #     '';
            #   };
            # }
          ];
          lualine_x = [""];
          lualine_y = [""];
          lualine_z = [
            {
              name = "filetype";
              extraConfig = {
                colored = false;
                icon_only = true;
              };

              color = {
                fg = nord0;
                bg = nord6;
              };
            }
            {
              name = "filename";
              extraConfig = {
                file_status = true;
                shorting_target = 25;
                path = 1;

                symbols = {
                  modified = "";
                  readonly = "";
                  unnamed = " ";
                  newfile = " ";
                };
              };

              separator = {
                left = "";
              };

              color = {
                fg = nord6;
                bg = nord10;
              };
            }
          ];
        };

        inactiveWinbar = {
          lualine_a = [""];
          lualine_b = [""];
          lualine_c = [""];
          lualine_x = [""];
          lualine_y = [""];
          lualine_z = [
            {
              name = "filetype";
              extraConfig = {
                colored = false;
                icon_only = true;
              };

              color = {
                fg = nord6;
                bg = nord1;
              };
            }
            {
              name = "filename";
              extraConfig = {
                file_status = true;
                path = 1;
                shorting_target = 25;

                symbols = {
                  modified = "";
                  readonly = "";
                  unnamed = " ";
                  newfile = " ";
                };
              };

              separator = {
                left = "";
              };

              color = {
                fg = nord6;
                bg = nord1;
              };
            }
          ];
        };
      };
    };
  };
}
