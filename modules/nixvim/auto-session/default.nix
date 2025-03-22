{
  plugins.auto-session = {
    enable = true;


    settings = {
      enabled = true;
      auto_save = true;
      auto_restore = true;
      bypass_save_filetypes = [
        "dashboard"
        "nvim-tree"
      ];
      auto_create = true;
      use_git_branch = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      action = "<cmd>Telescope session-lens<cr>";
      key = "<leader>fs";
      options = {
        desc = "Find Session";
      };
    }
  ];
}
