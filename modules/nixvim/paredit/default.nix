{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [
    nvim-paredit
		nvim-parinfer
  ];

	globals = {
		paredit_electric_return = 1;
	};
}
