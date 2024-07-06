{
  plugins.tmux-navigator = {
    enable = true;

    settings = {
      disable_when_zoomed = true;
      no_mappings = true;
    };

    keymaps = [
      {
        action = "left";
        key = "<m-h>";
        options = {
          silent = true;
          desc = "Navigate left";
        };
      }
      {
        action = "down";
        key = "<m-j>";
        options = {
          silent = true;
          desc = "Navigate down";
        };
      }
      {
        action = "up";
        key = "<m-k>";
        options = {
          silent = true;
          desc = "Navigate up";
        };
      }
      {
        action = "right";
        key = "<m-l>";
        options = {
          silent = true;
          desc = "Navigate right";
        };
      }
    ];
  };
}
