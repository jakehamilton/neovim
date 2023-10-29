{lib, ...}: {
  extraConfigLuaPre = ''
    vim.opt.shortmess:append("IWs")
  '';
}
