{ channels, ... }:

final: prev: {
  tree-sitter = prev.tree-sitter.override {
    extraGrammars = {
      tree-sitter-dotbox = {
        url = "https://github.com/jakehamilton/tree-sitter-dotbox";
        rev = "234f92d21f2a7b987477a763e117c58af47e429f";
        date = "2022-11-26T19:13:24-08:00";
        path = "/nix/store/793kqi4fi8r4sz2d8rv1x7ac6565brj0-tree-sitter-dotbox";
        sha256 = "0bxjlpxjk2rb6jb2xkz96ax7db2s8mkh9zhvdigdqdv98ni8x5fg";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };
    };
  };
}
