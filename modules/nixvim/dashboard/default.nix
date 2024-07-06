{ helpers, pkgs, ... }:
{
  plugins.dashboard = {
    enable = true;

    settings = {
      change_to_vcs_root = true;
      shortcut_type = "letter";

      hide = {
        statusline = true;
        tabline = true;
      };

      config = {
        disable_move = true;

        header = [
          ""
          ""
          "┏━┓╻  ╻ ╻┏━┓╻ ╻╻  ╺┳╸┏━┓┏━┓"
          "┣━┛┃  ┃ ┃┗━┓┃ ┃┃   ┃ ┣┳┛┣━┫"
          "╹  ┗━╸┗━┛┗━┛┗━┛┗━╸ ╹ ╹┗╸╹ ╹"
          ""
        ];

        footer = [ "" ];

        mru = {
          cwd_only = true;
          icon = " ";
          label = "Recent Files";
          limit = 10;
        };

        packages.enable = false;

        project = {
          enable = true;

          action = "e ";
          icon = "󰉋 ";
          label = "Projects";
          limit = 8;
        };

        shortcut = [
          {
            icon = " ";
            desc = "Session";
            key = "s";
            action = "Telescope session-lens";
          }
          {
            icon = " ";
            desc = "File ";
            key = "f";
            action = "Telescope find_files";
          }
          {
            icon = " ";
            desc = "Recent ";
            key = "r";
            action = "Telescope oldfiles";
          }
          {
            icon = " ";
            desc = "Config ";
            key = "c";
            action = "e $HOME/work/config";
          }
        ];
      };
    };
  };
}
