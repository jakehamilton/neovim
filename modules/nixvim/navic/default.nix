{
  plugins.navic = {
    enable = true;

    settings = {
      highlight = true;
      separator = "  ";

      lsp = {
        auto_attach = true;

        preference = [ "nixd" ];
      };
    };
  };
}
