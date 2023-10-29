{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    # null-ls has been forked to none-ls after the original author archived the project.
    none-ls = {
      enable = true;

      onAttach = ''
        function(client, bufnr)
          require("lsp-format").on_attach(client)
        end
      '';

      sources.formatting.prettier.enable = true;
    };

    lsp = {
      servers = {
        eslint = {
          capabilities = {
            # documentFormattingProvider = false;
          };
        };
        tsserver = {
          capabilities = {
            documentFormattingProvider = false;
          };
        };
      };
    };
  };
}
