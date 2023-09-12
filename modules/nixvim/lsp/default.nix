{pkgs, ...}: {
  plugins = {
    lsp = {
      enable = true;

      servers = {
        astro.enable = true;
        bashls.enable = true;
        cmake.enable = true;
        clangd.enable = true;
        eslint = {
          enable = true;

          extraOptions = {
            settings = {
              autoFixOnSave = true;
            };
          };
        };
        gopls.enable = true;
        html.enable = true;
        jsonls.enable = true;
        lua-ls.enable = true;
        pyright.enable = true;
        rust-analyzer.enable = true;
        tailwindcss.enable = true;
        tsserver.enable = true;
        yamlls.enable = true;

        nixd = {
          enable = true;

          settings = {
            formatting.command = "${pkgs.alejandra}/bin/alejandra";
          };
        };
      };
    };
  };

  extraConfigLuaPre = ''
    local diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }

    for type, icon in pairs(diagnostic_signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end

    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
      underline = true,
      update_in_insert = false,
      virtual_text = { spacing = 4, prefix = "●" },
      severity_sort = true,
    })
  '';
}
