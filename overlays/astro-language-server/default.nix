# FIXME: This file can be removed once `astro-language-server` is available directly on
# the pkgs instance.

{ channels, ... }:

final: prev: {
  inherit (channels.unstable) astro-language-server;
}
