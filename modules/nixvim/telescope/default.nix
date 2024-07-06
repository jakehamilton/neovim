{ helpers, pkgs, ... }:
{
  extraPackages = with pkgs; [ ripgrep ];

  plugins.telescope = {
    enable = true;

    keymaps = {
      "<C-p>" = {
        action = "git_files";
        options = {
          desc = "Telescope: Files";
        };
      };
      "<leader>ff" = {
        action = "git_files";
        options = {
          desc = "Telescope: Files";
        };
      };
      "<leader>fF" = {
        action = "find_files hidden=true";
        options = {
          desc = "Telescope: Files (hidden)";
        };
      };
      "<leader>fg" = {
        action = "live_grep";
        options = {
          desc = "Telescope: Grep";
        };
      };
      "<leader>fG" = {
        action = "live_grep hidden=true";
        options = {
          desc = "Telescope: Files";
        };
      };
    };

    extensions = {
      fzf-native.enable = true;
      media-files.enable = true;
      ui-select.enable = true;
    };
  };
}
