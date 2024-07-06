{
  plugins = {
    treesitter = {
      enable = true;

      indent = true;
      folding = true;
      nixvimInjections = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      action = "<cmd>Inspect<cr>";
      key = "gH";
      options = {
        desc = "Treesitter: Show captures";
        silent = true;
        noremap = true;
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      action = "<cmd>InspectTree<cr>";
      key = "<leader>tP";
      options = {
        desc = "Treesitter: Show tree";
        silent = true;
        noremap = true;
      };
    }
  ];
}
