{ lib, pkgs, vimPlugins, vimUtils, fetchFromGitHub, tree-sitter, callPackage, ... }:

let
  icon-picker = vimUtils.buildVimPluginFrom2Nix {
    pname = "icon-picker.nvim";
    version = "unstable-2022-09-03";
    src = fetchFromGitHub {
      owner = "ziontee113";
      repo = "icon-picker.nvim";
      rev = "0f3b2648f6f8e788bc8dfe37bc9bb18b565cfc3c";
      sha256 = "15zygdg8g8jf1n75nclrbddvp9fz8k4jiczv0amgc7x1dy46cbvy";
    };
  };
  telescope-manix = vimUtils.buildVimPluginFrom2Nix {
    pname = "telescope-manix";
    version = "unstable-2022-10-10";
    src = fetchFromGitHub {
      owner = "mrcjkb";
      repo = "telescope-manix";
      rev = "b254c28d7d793fe93cfaccf9bd53493a0c579e3b";
      sha256 = "059qfrvd7bigqkkjc5g6wdrzb7a7x37xxnx99hx236sxraihaka7";
    };
  };
  prettier-nvim = vimUtils.buildVimPluginFrom2Nix {
    pname = "prettier.nvim";
    version = "unstable-2022-11-14";
    src = fetchFromGitHub {
      owner = "MunifTanjim";
      repo = "prettier.nvim";
      rev = "6f19a4f68e7cce31a244c9479d47cce0c2a8f135";
      sha256 = "1dh29q778b58rvyhqidfixs7gx0n40y650k8jgj2iq4674frxmvj";
    };
  };
in
with vimPlugins; [
  # Icons
  nvim-web-devicons

  # Syntax
  vim-nix
  nvim-ts-rainbow
  (nvim-treesitter.withPlugins
    (plugins: tree-sitter.allGrammars))

  # Utility
  plenary-nvim
  vim-bufkill
  neodev-nvim
  dressing-nvim

  # Telescope
  telescope-nvim
  telescope-symbols-nvim
  telescope-project-nvim
  telescope-manix

  # Language Server
  nvim-lspconfig
  null-ls-nvim
  lsp-colors-nvim
  nvim-jdtls
  trouble-nvim
  prettier-nvim

  # Autocomplete
  nvim-cmp
  cmp-nvim-lsp

  # Snippets
  luasnip
  cmp_luasnip

  # Direnv
  direnv-vim

  # Text Manipulation
  vim-repeat
  vim-surround
  vim-commentary

  # Movement
  hop-nvim
  neoscroll-nvim

  # File Browser
  nvim-tree-lua

  # Editor Configuration
  editorconfig-nvim

  # Highlighting & View Augmentation
  vim-illuminate
  todo-comments-nvim
  delimitMate
  twilight-nvim

  # Theme
  nord-nvim

  # Status Line & Buffer Line
  lualine-nvim
  lualine-lsp-progress
  bufferline-nvim

  # Termianl
  toggleterm-nvim

  # Git
  gitsigns-nvim
  # vim-gitgutter
  # vim-fugitive
  # git-messenger-vim

  # Which Key
  which-key-nvim

  # Dashboard
  dashboard-nvim

  # Markdown
  markdown-preview-nvim
  vim-markdown
  vim-markdown-toc

  # Tmux
  vim-tmux-navigator

  # Icon Picker
  icon-picker
]
