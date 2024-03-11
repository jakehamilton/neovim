{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin
      {
        pname = "juice.nvim";
        version = "unstable-2024-03-11";
        src = pkgs.fetchFromGitHub {
          owner = "juicelang";
          repo = "juice.nvim";
          rev = "9827735bfbf34625f1ad0c74a22a71cf3655549b";
          sha256 = "11ipkbv6g7pd650f2r9nxslkc9vbkbj5s5h49kxa8g58i2l6i9l7";
        };
      })
  ];

  plugins = {
    treesitter = {
      grammarPackages =
        pkgs.vimPlugins.nvim-treesitter.allGrammars
        ++ (
          with pkgs.tree-sitter-grammars; [
            tree-sitter-juice
          ]
        );

      languageRegister = {
        juice = "juice";
      };
    };
  };
}
