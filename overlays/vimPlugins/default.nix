{ channels, ... }:

final: prev: {
  vimPlugins = prev.vimPlugins.extend (self: super: {
    inherit (channels.unstable.vimPlugins) comment-box-nvim;
  });
}
