{ pkgs, ... }:

with pkgs; [
  # Grammar
  tree-sitter

  # Language Servers
  sqls
  gopls
  rnix-lsp
  rust-analyzer
  sumneko-lua-language-server

  # Language Server Dependencies
  nodePackages.pyright
  nodePackages.tailwindcss

  # Formatters
  nixfmt
  rustfmt
  nodePackages.prettier

  # Utility
  ripgrep

  # Documentation
  manix

  # Misc
  lua5_1
]
