{lib, ...}:
with lib.plusultra; {
  maps = {
    normal = vim.mkSilentKeyBinds [
      ["<leader>tp" ":MarkdownPreviewToggle<cr>" "Toggle markdown preview"]
    ];
  };

  plugins = {
    markdown-preview = {
      enable = true;
      autoClose = false;
    };
  };
}
