{pkgs, ...}: {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin
      {
        pname = "dotbox.nvim";
        version = "unstable-2022-11-26";
        src = pkgs.fetchFromGitHub {
          owner = "jakehamilton";
          repo = "dotbox.nvim";
          rev = "4d6eaee93f7a890a0ef5d993ff00a05af48c1374";
          sha256 = "0s65xsrqkjdy4zmqxh2gn17kh1d2b7w2jvwa6hrrw1nag4h6cids";
        };
      })
  ];

  plugins = {
    treesitter = {
      grammarPackages =
        pkgs.vimPlugins.nvim-treesitter.allGrammars
        ++ (
          with pkgs.tree-sitter-grammars; [
            tree-sitter-dotbox
          ]
        );

      languageRegister = {
        dotbox = "dotbox";
      };
    };
  };
}
