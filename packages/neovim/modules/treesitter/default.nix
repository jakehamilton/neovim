{pkgs, ...}: {
  plugins = {
    treesitter = {
      enable = true;

      # NOTE: This is currently broken due to how nvim-treesitter handles grammars differently
      # than the tree-sitter package.
      # https://github.com/NixOS/nixpkgs/blob/4c8cf44c5b9481a4f093f1df3b8b7ba997a7c760/pkgs/applications/editors/vim/plugins/nvim-treesitter/overrides.nix#L6
      # grammarPackages = pkgs.tree-sitter.passthru.allGrammars;
    };
  };
}
