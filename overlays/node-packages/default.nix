{channels, ...}: final: prev: let
  node-packages = import ./create-node-packages.nix {
    inherit (prev) system;
    pkgs = prev;
    nodejs = prev.nodejs-18_x;
  };
  prisma-language-server = node-packages."@prisma/language-server".override {
    dontNpmInstall = true;
    postInstall = ''
      file="$out/lib/node_modules/@prisma/language-server/dist/src/bin.js"

      chmod +x "$file"
    '';
  };
  tailwindcss-language-server = node-packages."@tailwindcss/language-server";
  astrojs-language-server = node-packages."@astrojs/language-server";
in {
  nodePackages =
    prev.nodePackages
    // {
      inherit prisma-language-server tailwindcss-language-server astrojs-language-server;
    };
}
