{
  lib,
  pkgs,
  ...
}:
with lib.plusultra;
with lib.plusultra.theme.nord; {
  extraPlugins = [
    (pkgs.vimUtils.buildVimPlugin {
      pname = "dbsession.nvim";
      version = "unstable-2023-05-31";
      src = pkgs.fetchFromGitHub {
        owner = "nvimdev";
        repo = "dbsession.nvim";
        rev = "8a9d15244190e5f191beef03d50f988e5077446c";
        sha256 = "12yrmnphspb3nyrsgvmp5m270k5hkw1gna904ypl90smskc4wiyx";
      };
    })
  ];

  extraConfigLua = ''
    require("dbsession").setup {
      dir = os.getenv("HOME") .. "/.config/dashboard-nvim",
      auto_save_on_exit = false,
    }
  '';

  highlight = {
    DashboardShortCut = {
      fg = nord3;
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ss";
      action = "<cmd>SessionSave<cr>";
      options = {
        silent = true;
        desc = "Save session";
      };
    }
    {
      mode = "n";
      key = "<leader>sl";
      action = "<cmd>SessionLoad<cr>";
      options = {
        silent = true;
        desc = "Load session";
      };
    }
  ];

  plugins = {
    dashboard = {
      enable = true;

      theme = "hyper";
      disableMove = true;
      changeToVcsRoot = true;

      packages.enable = false;
      week_header.enable = false;

      hide = {
        statusline = true;
        tabline = true;
        winbar = true;
      };

      project = {
        # There is currently a bug where loading projects on launch will throw an error,
        # breaking the first buffer used. Disabling this removes quick project access, but
        # avoids the issue.
        enable = false;
        icon = "󰉋 ";
        label = "Projects";
        limit = 8;
        action = "e ";
      };

      mru = {
        icon = " ";
        label = "Recent Files";
        limit = 10;
      };

      shortcut = [
        {
          icon = " ";
          desc = "Open File ";
          key = "f";
          action = "Telescope find_files";
        }
        {
          icon = " ";
          desc = "Open Recent ";
          key = "r";
          action = "Telescope oldfiles";
        }
        {
          icon = " ";
          desc = "Open Config ";
          key = "c";
          action = "e $HOME/work/config";
        }
      ];

      header = [
        ""
        ""
        "┏━┓╻  ╻ ╻┏━┓╻ ╻╻  ╺┳╸┏━┓┏━┓"
        "┣━┛┃  ┃ ┃┗━┓┃ ┃┃   ┃ ┣┳┛┣━┫"
        "╹  ┗━╸┗━┛┗━┛┗━┛┗━╸ ╹ ╹┗╸╹ ╹"
        ""
      ];

      footer = lua.mkRaw ''
        (function()
          local fortune_handle = io.popen("${pkgs.fortune}/bin/fortune -s")
          local fortune_output = nil

          if fortune_handle ~= nil then
            fortune_output = fortune_handle:read("*a")
            fortune_handle:close()
          else
            fortune_output = "fortune_handle was nil"
          end

          local footer = { "", "" }

          if fortune_output ~= nil then
            for line in string.gmatch(fortune_output, "(.-)\n") do
              table.insert(footer, line)
            end
          else
            table.insert(footer, "Go even further beyond ✨")
          end

          return footer
        end)()
      '';
    };
  };
}
