{
  lib,
  pkgs,
  ...
}: {
  plugins = {
    # null-ls has been forked to none-ls after the original author archived the project.
    none-ls = {
      enable = true;
      enableLspFormat = true;

      sources.formatting.prettier = {
        enable = true;
        disableTsServerFormatter = true;
      };
    };

    lsp = {
      servers = {
        eslint = {
          capabilities = {
            # documentFormattingProvider = false;
          };
        };
      };
    };
  };
}
