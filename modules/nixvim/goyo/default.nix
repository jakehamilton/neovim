{
  plugins.goyo = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      action = "<cmd>Goyo<cr>";
      key = "<leader>tg";
      options = {
        desc = "Toggle Goyo";
      };
    }
  ];
}
