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
      tree-sitter-prisma = {
        url = "https://github.com/victorhqc/tree-sitter-prisma";
        rev = "17a59236ac25413b81b1613ea6ba5d8d52d7cd6c";
        date = "2022-06-11T23:04:44+02:00";
        path = "/nix/store/qdkwinjdy495z59wvxhifk8caksndswj-tree-sitter-prisma";
        sha256 = "1pw9mi6hhvww4i7gf7snl893b3hwnfwp18rhbcsf7z52cr78mmqi";
        fetchLFS = false;
        fetchSubmodules = false;
        deepClone = false;
        leaveDotGit = false;
      };
      # @TODO(jakehamilton): There doesn't seem to be a Neovim plugin for
      # Astro yet. Could probably make one...
      #
      # tree-sitter-astro = {
      #   url = "https://github.com/virchau13/tree-sitter-astro";
      #   rev = "a1f66bf72ed68b87f779bce9a52e5c6521fc867e";
      #   date = "2022-12-29T16:41:35+08:00";
      #   path = "/nix/store/9m6x5g0nwdhgw9abh8kj7m14vgh13j4y-tree-sitter-astro";
      #   sha256 = "155khx6zvhlilpzkd3pxlqki7bgjfx475mf33zran7h000jwxsa3";
      #   fetchLFS = false;
      #   fetchSubmodules = false;
      #   deepClone = false;
      #   leaveDotGit = false;
      # };
    };
  };
}
