{ helpers, lib, ... }:
let
  theme = lib.plusultra.theme.nord;
in
{
  plugins.lualine = {
    enable = true;

    settings = {
      options = {
        globalstatus = true;

        disabled_filetypes = {
          statusline = [
            "dashboard"
            "NvimTree"
            "Trouble"
          ];
          winbar = [
            "dashboard"
            "NvimTree"
            "Trouble"
          ];
        };

        ignore_focus = [
          "dashboard"
          "NvimTree"
          "Trouble"
        ];

        component_separators = {
          left = "⋮";
          right = "⋮";
        };

        section_separators = {
          left = "";
          right = "";
        };

        theme = with theme; {
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
      };

      sections = {
        lualine_a = [
          {
            __unkeyed-1 = helpers.mkRaw ''
              function()
                return ""
              end
            '';
          }
        ];
        lualine_b = [
          {
            __unkeyed-1 = "branch";
            icon = "";
          }
          { __unkeyed-1 = "diff"; }
        ];
        lualine_c = [ "" ];
        lualine_x = [
          {
            __unkeyed-1 = "diagnostics";
            update_in_insert = true;
          }
        ];
        lualine_y = [ "" ];
        lualine_z = [
          { __unkeyed-1 = "%l:%c"; }
          {
            __unkeyed-1 = "fileformat";
            icon_only = true;
          }
        ];
      };

      tabline = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [
          {
            __unkeyed-1 = "windows";

            symbols = {
              modified = "";
              readonly = "";
              unnamed = " ";
              newfile = " ";
            };

            windows_color = {
              active = {
                fg = theme.nord6;
                bg = theme.nord10;
              };
              inactive = {
                fg = theme.nord6;
                bg = theme.nord1;
              };
            };

            separator = {
              right = "";
            };
          }
        ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [
          {
            __unkeyed-1 = "tabs";

            tabs_color = {
              active = {
                fg = theme.nord6;
                bg = theme.nord10;
              };
              inactive = {
                fg = theme.nord6;
                bg = theme.nord1;
              };
            };

            separator = {
              left = "";
            };
          }
        ];
      };

      winbar = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [
          ""
          {
            __unkeyed-1 = helpers.mkRaw ''
              require('nvim-navic').get_location
            '';

            cond = helpers.mkRaw ''
              require('nvim-navic').is_available
            '';
          }
        ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [
          {
            __unkeyed-1 = "filetype";

            colored = false;
            icon_only = true;

            color = {
              fg = theme.nord0;
              bg = theme.nord6;
            };
          }
          {
            __unkeyed-1 = "filename";
            file_status = true;
            shorting_target = 25;
            path = 1;

            symbols = {
              modified = "";
              readonly = "";
              unnamed = " ";
              newfile = " ";
            };

            separator = {
              left = "";
            };

            color = {
              fg = theme.nord6;
              bg = theme.nord10;
            };
          }
        ];
      };

      inactive_winbar = {
        lualine_a = [ "" ];
        lualine_b = [ "" ];
        lualine_c = [ "" ];
        lualine_x = [ "" ];
        lualine_y = [ "" ];
        lualine_z = [
          {
            __unkeyed-1 = "filetype";
            colored = false;
            icon_only = true;

            color = {
              fg = theme.nord6;
              bg = theme.nord1;
            };
          }
          {
            __unkeyed-1 = "filename";
            file_status = true;
            path = 1;
            shorting_target = 25;

            symbols = {
              modified = "";
              readonly = "";
              unnamed = " ";
              newfile = " ";
            };

            separator = {
              left = "";
            };

            color = {
              fg = theme.nord6;
              bg = theme.nord1;
            };
          }
        ];
      };
    };
  };

  highlight = with theme; {
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
}
