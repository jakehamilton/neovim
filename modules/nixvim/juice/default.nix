{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin
      {
        pname = "juice.nvim";
        version = "unstable-2024-03-11";
        src = pkgs.fetchFromGitHub {
          owner = "juicelang";
          repo = "juice.nvim";
          rev = "955d64ed0020cc86777c8995fba99e2d36ba0d0f";
          sha256 = "0av5b2h7bfpa4ikrn1fxbicbrfarhqkjm6l02i5fm0y2rsiw7fl5";
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
