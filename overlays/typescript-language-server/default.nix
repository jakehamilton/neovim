# FIXME: This file can be removed once `typescript-language-server` is available directly on
# the pkgs instance.

{ channels, ... }:

final: prev: {
  inherit (prev.nodePackages) typescript-language-server;
}
