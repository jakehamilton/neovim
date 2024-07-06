{ pkgs, ... }: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin
      {
        pname = "juice.nvim";
        version = "unstable-2024-03-11";
        src = pkgs.fetchFromGitHub {
          owner = "juicelang";
          repo = "juice.nvim";
          rev = "d755cef50db6f2dfc33edf6755c6524753be71be";
          sha256 = "0mj30py0b9bcln631j258vihc6s3crwmfkcgcr39rjsy9f04x4mv";
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
