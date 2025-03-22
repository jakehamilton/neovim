{ pkgs, ... }: {
  extraPlugins = [
    # (pkgs.vimUtils.buildVimPlugin
    #   {
    #     pname = "juice.nvim";
    #     version = "unstable-2024-03-11";
    #     src = pkgs.fetchFromGitHub {
    #       owner = "juicelang";
    #       repo = "juice.nvim";
    #       rev = "388b3a55bfa8742477783dddf946546c41ad2fc3";
    #       sha256 = "1c70s3h80zr64l32dyk0mlh5pjfrmbz7rnlmpagk6bg44xh7r34m";
    #     };
    #   })
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
