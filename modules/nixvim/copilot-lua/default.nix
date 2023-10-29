{lib, ...}:
with lib.plusultra; {
  keymaps = [
    {
      mode = "n";
      key = "<leader>oc";
      action = "<cmd>:Copilot panel<cr>";
      options = {
        silent = true;
        desc = "Open Copilot";
      };
    }
    {
      mode = "n";
      key = "<leader>tc";
      action = "<cmd>:lua require('copilot.suggestion').toggle_auto_trigger()<cr>";
      options = {
        silent = true;
        desc = "Toggle Copilot";
      };
    }
  ];

  plugins = {
    copilot-lua = {
      enable = true;

      suggestion = {
        enabled = false;
        autoTrigger = false;

        keymap = {
          accept = "<C-l>";
          next = "<C-j>";
          prev = "<C-k>";
          dismiss = "<C-h>";
        };
      };
      panel = {
        enabled = false;

        keymap = {
          open = false;
          accept = "<cr>";
          jumpNext = "<C-j>";
          jumpPrev = "<C-k>";
          refresh = "<C-r>";
        };
      };

      filetypes = {
        javascript = true;
        typescript = true;
        css = true;
        rust = true;
        python = true;
        java = true;
        c = true;
        cpp = true;
        nix = true;
        lua = true;

        yaml = true;
        markdown = true;
        help = false;
        gitcommit = false;
        gitrebase = false;
        hgcommit = false;
        svn = false;
        cvs = false;
        "." = false;
      };
    };
  };
}
