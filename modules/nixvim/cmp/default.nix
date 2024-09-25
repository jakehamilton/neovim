{ helpers, ... }:
{
  plugins = {
    luasnip.enable = true;

    cmp = {
      enable = true;

      cmdline =
        let
          search = {
            mapping =
              helpers.mkRaw # lua
                "cmp.mapping.preset.cmdline()";
            sources = [{ name = "buffer"; }];
          };
        in
        {
          "/" = search;
          "?" = search;
          ":" = {
            mapping =
              helpers.mkRaw # lua
                "cmp.mapping.preset.cmdline()";
            sources = [{ name = "cmdline"; }];
          };
        };

      settings = {
        experimental = {
          ghost_text = true;
        };

        mapping = {
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-j>" = "cmp.mapping.scroll_docs(4)";
          "<C-k>" = "cmp.mapping.scroll_docs(-4)";
          "<C-l>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          "<C-n>" =
            helpers.mkRaw # lua
              ''
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
          "<C-p>" =
            helpers.mkRaw # lua
              ''
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
        };

        snippet = {
          expand = ''function(args) require("luasnip").lsp_expand(args.body) end'';
        };

        sources = [
          { name = "path"; }
          { name = "copilot"; }
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "dictionary"; }
        ];
      };
    };

    # cmp-cmdline.enable = true;
    # copilot-cmp.enable = true;
    # cmp-dictionary.enable = true;
    # cmp-fuzzy-path.enable = true;
    # cmp-fuzzy-buffer.enable = true;
    # cmp-nvim-lsp.enable = true;
    # cmp_luasnip.enable = true;
  };
}
