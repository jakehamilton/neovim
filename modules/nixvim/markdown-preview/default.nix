{lib, ...}:
with lib.plusultra; {
  keymaps = [
    {
      mode = "n";
      key = "<leader>tp";
      action = ":MarkdownPreviewToggle<cr>";
      options = {
        silent = true;
        desc = "Toggle markdown preview";
      };
    }
  ];

  plugins = {
    markdown-preview = {
      enable = true;
      autoClose = false;
    };
  };
}
