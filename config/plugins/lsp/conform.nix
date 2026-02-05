{ pkgs, lib, ... }:
{
  plugins.conform-nvim = {
    enable = true;
    settings = {
      format_on_save.__raw = ''
        function(bufnr)
          if vim.g.disable_autoformat then
            return nil
          end
          return {
            lsp_fallback = true,
            timeout_ms = 10000,
          }
        end
      '';

      formatters_by_ft = {
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };

      formatters = {
        _ = {
          command = "${pkgs.gawk}/bin/gawk";
        };
        squeeze_blanks = {
          command = lib.getExe' pkgs.coreutils "cat";
        };
      };
    };
  };

  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua require('conform').format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
    {
      mode = [ "n" ];
      key = "<leader>fT";
      action.__raw = ''
        function()
          vim.g.disable_autoformat = not vim.g.disable_autoformat
          if vim.g.disable_autoformat then
            vim.notify("Disabled format on save", vim.log.levels.WARN)
          else
            vim.notify("Enabled format on save", vim.log.levels.INFO)
          end
        end
      '';
      options = {
        desc = "Toggle format on save";
      };
    }
  ];
}
