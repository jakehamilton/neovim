{
  plugins.copilot-lua = {
    enable = true;

    settings = {
      panel = {
        enabled = false;
        auto_refresh = true;
        keymap = {
          jumpPrev = "[[";
          jumpNext = "]]";
          accept = "<cr>";
          refresh = "gr";
          open = "<C-CR>";
        };
        layout = {
          position = "right";
        };
      };

      suggestion = {
        enabled = false;
        auto_trigger = true;
        debounce = 75;
        keymap = {
          accept = "<C-l>";
          accept_word = false;
          accept_line = false;
          next = "<C-]>";
          prev = "<C-[>";
          dismiss = "<C-c>";
        };
      };

      filetypes = {
        yaml = false;
        markdown = false;
        help = false;
        gitcommit = false;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
        "." = false;
        "*" = true;
      };
    };
  };
}
