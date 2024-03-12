{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin
      {
        pname = "juice.nvim";
        version = "unstable-2024-03-11";
        src = pkgs.fetchFromGitHub {
          owner = "juicelang";
          repo = "juice.nvim";
          rev = "3df5433c8f7d4cd5b3f2230356bf0ba389f66ba7";
          sha256 = "1aa2x7wxb3bvyjwa35wvzpkr2m23x4alnjgnr1c93zk1x5v87v01";
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
