{
  lib,
  pkgs,
  config,
  ...
}:
with lib.plusultra;
with lib.plusultra.theme.nord; let
  bufferline-buffer-text = nord6;
  bufferline-buffer-background = nord1;
  bufferline-buffer-focus-text = nord6;
  bufferline-buffer-focus-background = nord3;
in {
  extraPlugins = with pkgs.vimPlugins; [
    vim-bufkill
  ];

  globals = {
    BufKillCreateMappings = 0;
  };

  maps = {
    normal = vim.mkSilentKeyBinds [
      ["gb" "<cmd>:BufferLinePick<cr>" "Go to buffer"]
      ["<leader>bd" "<cmd>:BD<cr>" "Delete buffer"]
      ["<leader>bn" "<cmd>:bnext<cr>" "Next buffer"]
      ["<leader>bp" "<cmd>:bprevious<cr>" "Previous buffer"]
    ];
  };

  plugins = {
    bufferline = {
      enable = false;
      mode = "buffers";
      persistBufferSort = true;
      alwaysShowBufferline = true;
      separatorStyle = "slant";
      diagnosticsUpdateInInsert = true;

      showCloseIcon = false;
      showBufferIcons = false;
      showBufferCloseIcons = false;

      offsets = [
        {
          filetype = "NvimTree";
          text = "NvimTree";
          highlight = "Directory";
          textAlign = "left";
        }
      ];

      diagnostics = "nvim_lsp";
      diagnosticsIndicator = ''
        function(_, _, diagnostic)
          local signs = { error = " ", warning = " ", hint = " ", info = " " }
          local severities = { "error", "warning" }
          local strs = {}
          for _, severity in ipairs(severities) do
            if diagnostic[severity] then
              table.insert(strs, signs[severity] .. diagnostic[severity])
            end
          end

          return table.concat(strs, " ")
        end
      '';

      # Show highlights with `:Telescope highlights`
      highlights = {
        background = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        fill = {
          bg = nord0;
        };
        tab = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        tabSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        info = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        pick = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        error = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        errorVisible = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        errorSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        bufferVisible = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        bufferSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        hint = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        hintSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        warning = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        warningSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        modified = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        modifiedVisible = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        modifiedSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        tabClose = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        duplicate = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        duplicateSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        separator = {
          fg = nord0;
          bg = bufferline-buffer-background;
        };
        separatorVisible = {
          fg = nord0;
          bg = bufferline-buffer-background;
        };
        separatorSelected = {
          fg = nord0;
          bg = bufferline-buffer-focus-background;
        };
        diagnostic = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        diagnosticVisible = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        diagnosticSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        closeButton = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        infoDiagnostic = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        errorDiagnostic = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        errorDiagnosticVisible = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        errorDiagnosticSelected = {
          fg = bufferline-buffer-focus-text;
          bg = bufferline-buffer-focus-background;
        };
        warningDiagnostic = {
          fg = bufferline-buffer-text;
          bg = bufferline-buffer-background;
        };
        tabSeparator = {
          fg = nord0;
          bg = bufferline-buffer-background;
        };
        tabSeparatorSelected = {
          fg = nord0;
          bg = bufferline-buffer-background;
        };
      };
    };
  };
}
