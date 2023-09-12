{...}: {
  globals = {
    tmux_navigator_no_mappings = 1;
  };

  maps = {
    normal = {
      # tmux-navigator
      "<m-h>" = {
        silent = true;
        action = "<cmd>TmuxNavigateLeft<cr>";
      };
      "<m-j>" = {
        silent = true;
        action = "<cmd>TmuxNavigateDown<cr>";
      };
      "<m-k>" = {
        silent = true;
        action = "<cmd>TmuxNavigateUp<cr>";
      };
      "<m-l>" = {
        silent = true;
        action = "<cmd>TmuxNavigateRight<cr>";
      };
    };
  };

  plugins = {
    tmux-navigator = {
      enable = true;

      tmuxNavigatorNoWrap = 1;
      tmuxNavigatorDisableWhenZoomed = 1;
    };
  };
}
