{ lib
, pkgs
, vimPlugins
, vimUtils
, fetchFromGitHub
, tree-sitter
, callPackage
, ...
}:

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
  tree-sitter-playground = vimUtils.buildVimPluginFrom2Nix {
    pname = "tree-sitter-playground";
    version = "unstable-2022-11-26";
    src = fetchFromGitHub {
      owner = "nvim-treesitter";
      repo = "playground";
      rev = "1290fdf6f2f0189eb3b4ce8073d3fda6a3658376";
      sha256 = "1yznmc5a32b4bw0c9q0jfkbd77xmi7rmihfr0f44bcgqdxlp8151";
    };
  };
  dotbox-nvim = vimUtils.buildVimPluginFrom2Nix {
    pname = "dotbox.nvim";
    version = "unstable-2022-11-26";
    src = fetchFromGitHub {
      owner = "jakehamilton";
      repo = "dotbox.nvim";
      rev = "4d6eaee93f7a890a0ef5d993ff00a05af48c1374";
      sha256 = "0s65xsrqkjdy4zmqxh2gn17kh1d2b7w2jvwa6hrrw1nag4h6cids";
    };
  };
  vim-astro = vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-astro";
    version = "unstable-2022-01-11";
    src = fetchFromGitHub {
      owner = "wuelnerdotexe";
      repo = "vim-astro";
      rev = "34732be5e9a5c28c2409f4490edf92d46d8b55a9";
      sha256 = "1ild33hxiphj0z8b4kpcad4rai7q7jd0lsmhpa30kfgmyj5kh90z";
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
  tree-sitter-playground

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
  scope-nvim
  bufferline-nvim
  nvim-navic

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

  # Dotbox
  dotbox-nvim

  # Astro
  vim-astro

  # Tmux
  vim-tmux-navigator

  # Icon Picker
  icon-picker

  # Prisma
  vim-prisma
]
