{nixvim, ...}: final: prev: {
  nixvim = nixvim.legacyPackages.${prev.system};
}
