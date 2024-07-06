{
  plugins.hop.enable = true;

  keymaps = [
    {
      key = "<leader><leader>a";
      action = "<cmd>HopAnywhere<cr>";
      options = {
        desc = "Hop Anywhere";
      };
    }
    {
      key = "<leader><leader>c";
      action = "<cmd>HopChar1<cr>";
      options = {
        desc = "Hop Char";
      };
    }
    {
      key = "<leader><leader>C";
      action = "<cmd>HopChar2<cr>";
      options = {
        desc = "Hop Chars";
      };
    }
    {
      key = "<leader><leader>l";
      action = "<cmd>HopLineStart<cr>";
      options = {
        desc = "Hop To Line Start";
      };
    }
    {
      key = "<leader><leader>L";
      action = "<cmd>HopLine<cr>";
      options = {
        desc = "Hop To Line";
      };
    }
    {
      key = "<leader><leader>v";
      action = "<cmd>HopVertical<cr>";
      options = {
        desc = "Hop Vertical";
      };
    }
    {
      key = "<leader><leader>p";
      action = "<cmd>HopPattern<cr>";
      options = {
        desc = "Hop To Pattern";
        silent = true;
      };
    }
    {
      key = "<leader><leader>b";
      action = "<cmd>HopWordBC<cr>";
      options = {
        desc = "Hop To Previous Word";
      };
    }
    {
      key = "<leader><leader>w";
      action = "<cmd>HopWordAC<cr>";
      options = {
        desc = "Hop To Next Word";
      };
    }
    {
      key = "<leader><leader>W";
      action = "<cmd>HopWord<cr>";
      options = {
        desc = "Hop To Word";
      };
    }
  ];
}
