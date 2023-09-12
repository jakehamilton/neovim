{...}: {
  plugins = {
    lsp-format = {
      enable = true;

      setup.typescript = {
        order = ["null-ls"];

        exclude = [
          "tsserver"
          "eslint"
        ];
      };
    };
  };
}
