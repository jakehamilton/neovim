{...}: {
  config = {
    options = {
      list = true;
      listchars = "eol:↴,nbsp:↲,space: ,tab: ,trail:-";
    };

    plugins = {
      indent-blankline = {
        enable = true;
        showCurrentContext = true;
        showCurrentContextStart = true;
        showEndOfLine = true;
        spaceCharBlankline = " ";
        buftypeExclude = ["terminal" "nofile"];
        filetypeExclude = ["help" "dashboard" "NvimTree" "Trouble"];
        useTreesitter = true;
      };
    };
  };
}
