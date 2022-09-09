{ lib, vimPlugins, neovimUtils, fetchFromGitHub, tree-sitter, ... }:

let
  x = true;
  icon-picker = neovimUtils.buildNeovimPluginFrom2Nix {
    pname = "icon-picker.nvim";
    version = "2022-09-03";
    src = fetchFromGitHub {
      owner = "ziontee113";
      repo = "icon-picker.nvim";
      rev = "0f3b2648f6f8e788bc8dfe37bc9bb18b565cfc3c";
      sha256 = "15zygdg8g8jf1n75nclrbddvp9fz8k4jiczv0amgc7x1dy46cbvy";
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
  lua-dev-nvim
  dressing-nvim

  # Telescope
  telescope-nvim
  telescope-symbols-nvim
  telescope-project-nvim

  # Language Server
  nvim-lspconfig
  lsp-colors-nvim
  nvim-jdtls
  trouble-nvim

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
