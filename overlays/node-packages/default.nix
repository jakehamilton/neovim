{ channels, ... }:

final: prev:
let
  node-packages = import ./create-node-packages.nix {
    inherit (prev) system;
    pkgs = prev;
    nodejs = prev.nodejs-16_x;
  };
  prisma-language-server = node-packages."@prisma/language-server".override {
    dontNpmInstall = true;
    postInstall = ''
      file="$out/lib/node_modules/@prisma/language-server/dist/src/bin.js"

      chmod +x "$file"
    '';
  };
in
{
  nodePackages = prev.nodePackages // {
    inherit prisma-language-server;
  };
}
