{ channels, ... }:

final: prev: {
  tree-sitter = prev.tree-sitter.override {
    extraGrammars = {
      tree-sitter-dotbox = {
        url = "https://github.com/jakehamilton/tree-sitter-dotbox";
        rev = "ae903dc1fa13d19670671485c096add7524fd7fd";
        date = "2022-11-26T04:40:53-08:00";
        path = "/nix/store/4bdpdvv2q0cf53ikzhcmfdcisjmna8n9-tree-sitter-dotbox";
        sha256 = "0517yfl63qr3l46crp5dlvblxr3svylnxi7qlhcam4fkcpylva8v";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };
    };
  };
}
