{ channels, ... }:
final: prev:
let
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
    rev = "ae1a5b8b5c3c4875d1c11107ef96dc7e0c20c4b6";
    sha256 = "1fms6w757shmlzbvir31329w9l0idv7wwy28ff6qj66s1g0z96xs";
    fetchLFS = false;
    fetchSubmodules = false;
    deepClone = false;
    leaveDotGit = false;
  };
in
{
  tree-sitter-grammars = prev.tree-sitter-grammars // {
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
