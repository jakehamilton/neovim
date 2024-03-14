{channels, ...}: final: prev: let
  tree-sitter-dotbox = {
    url = "https://github.com/jakehamilton/tree-sitter-dotbox";
    rev = "234f92d21f2a7b987477a763e117c58af47e429f";
    sha256 = "0bxjlpxjk2rb6jb2xkz96ax7db2s8mkh9zhvdigdqdv98ni8x5fg";
    fetchLFS = false;
    fetchSubmodules = false;
    deepClone = false;
    leaveDotGit = false;
  };
  tree-sitter-juice = {
    url = "https://github.com/juicelang/tree-sitter-juice";
    rev = "d729c3bcb903aaf5aa010d595f2744b96794c082";
    sha256 = "1g7n3pajl1b10aw4vkvs255mc0fpgxf7bldbprm87rkfhmdpib69";
    fetchLFS = false;
    fetchSubmodules = false;
    deepClone = false;
    leaveDotGit = false;
  };
in {
  tree-sitter-grammars =
    prev.tree-sitter-grammars
    // {
      tree-sitter-dotbox = prev.tree-sitter.buildGrammar {
        language = "dotbox";
        src = prev.fetchgit tree-sitter-dotbox;
        version = "unstable-2022-11-26";
      };
      tree-sitter-juice = prev.tree-sitter.buildGrammar {
        language = "juice";
        src = prev.fetchgit tree-sitter-juice;
        version = "unstable-2024-03-11";
      };
    };

  tree-sitter = prev.tree-sitter.override {
    extraGrammars = {
      inherit tree-sitter-dotbox tree-sitter-juice;
    };
  };
}
