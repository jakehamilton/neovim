{lib, ...}:
with lib.plusultra; {
  maps = {
    normal = vim.mkSilentKeyBinds [
      ["<leader>tt" "<cmd>:TroubleToggle<cr>" "Toggle trouble"]
    ];
  };

  plugins = {
    trouble = {
      enable = true;

      autoClose = true;
      autoPreview = true;
      useDiagnosticSigns = true;

      extraOptions = {
        action_keys = {
          close = "q";
          cancel = "<esc>";
          refresh = "r";
          jump = ["<cr>" "<tab>"];
          open_split = ["S"];
          open_vsplit = ["s"];
          open_tab = ["<c-t>"];
          jump_close = ["o"];
          toggle_mode = ["m"];
          toggle_preview = ["P"];
          hover = "K";
          preview = "p";
          close_folds = ["zC" "zc"];
          open_folds = ["zO" "zo"];
          toggle_fold = ["zA" "za"];
          previous = "k";
          next = "j";
        };
      };
    };
  };
}
