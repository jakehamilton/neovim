{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    luasnip
  ];

  plugins = {
    nvim-cmp = {
      enable = true;

      snippet.expand = "luasnip";

      mappingPresets = ["insert"];

      sources = [
        {
          name = "copilot";
          groupIndex = 1;
          priority = 4;
        }
        {
          name = "nvim_lsp";
          groupIndex = 1;
          priority = 3;
        }
        {
          name = "luasnip";
          option = {
            show_autosnippets = true;
          };
          groupIndex = 1;
          priority = 5;
        }
        {
          name = "path";
          groupIndex = 1;
        }
        {
          name = "buffer";
          groupIndex = 2;
          priority = 2;
        }
      ];

      mapping = {
        "<C-Space>" = "cmp.mapping.complete()";
        "<C-j>" = "cmp.mapping.scroll_docs(4)";
        "<C-k>" = "cmp.mapping.scroll_docs(-4)";
        "<C-l>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        "<C-n>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
              else
                fallback()
              end
            end
          '';

          modes = ["i" "s"];
        };
        "<C-p>" = {
          action = ''
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              elseif require("luasnip").expand_or_jumpable() then
                require("luasnip").expand_or_jump()
              else
                fallback()
              end
            end
          '';

          modes = ["i" "s"];
        };
      };
    };
  };
}
