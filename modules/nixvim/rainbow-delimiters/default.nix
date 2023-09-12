{lib, ...}:
with lib.plusultra.theme.nord; {
  highlight = {
    RainbowDelimiterBlue.fg = nord7;
    RainbowDelimiterOrange.fg = nord12;
    RainbowDelimiterGreen.fg = nord14;
    RainbowDelimiterViolet.fg = nord15;
    RainbowDelimiterCyan.fg = nord9;
  };

  plugins = {
    rainbow-delimiters = {
      enable = true;

      highlight = [
        "RainbowDelimiterViolet"
        "RainbowDelimiterBlue"
        "RainbowDelimiterGreen"
        "RainbowDelimiterCyan"
        # "RainbowDelimiterOrange"
      ];
    };
  };
}
