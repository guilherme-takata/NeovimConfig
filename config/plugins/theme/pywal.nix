{ pkgs, ... }:
{
  extraPlugins = with pkgs.vimPlugins; [ pywal-nvim ];
  # extraConfigLua = ''
  #   require("pywal").setup
  # '';
  colorscheme = "pywal";
  # colorscheme = "pywal";
}
