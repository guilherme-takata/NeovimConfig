{ pkgs, ... }:
{
  plugins = {
    conform-nvim = {
      settings = {
        formatters_by_ft = {
          terraform = [ "tofu_fmt" ];
          tf = [ "tofu_fmt" ];
        };
      };
    };
    lsp.servers = {
      dockerls.enable = true;
      terraformls.enable = true;
    };
  };
}
