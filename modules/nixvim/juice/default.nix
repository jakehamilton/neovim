{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin
      {
        pname = "juice.nvim";
        version = "unstable-2024-03-11";
        src = pkgs.fetchFromGitHub {
          owner = "juicelang";
          repo = "juice.nvim";
          rev = "24b38843e48557cc8f29bca7c4e7f27b2b2bc396";
          sha256 = "1zf87y2mg6ahqa4vpdqavjd12ccc2f1lyv5iq7iq7xwinmj8d59m";
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
