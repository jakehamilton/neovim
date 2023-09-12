{...}: {
  plugins = {
    undotree = {
      enable = true;

      # https://github.com/mbbill/undotree/blob/0e11ba7325efbbb3f3bebe06213afa3e7ec75131/plugin/undotree.vim#L29
      windowLayout = 3;
      focusOnToggle = true;
      treeNodeShape = "";
      autoOpenDiff = false;
    };
  };

  extraConfigVim = ''
    if has("persistent_undo")
       let target_path = expand('~/.cache/undodir')

        " create the directory and any parent directories
        " if the location does not exist.
        if !isdirectory(target_path)
            call mkdir(target_path, "p", 0700)
        endif

        let &undodir=target_path
        set undofile
    endif
  '';
}
