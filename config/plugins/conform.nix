# conform.nix
# plugin for auto formatting

{ pkgs, ... }:

{
  # dependencies
  extraPackages = with pkgs; [ stylua ];

  plugins.conform-nvim = {
    enable = true;

    notifyOnError = false;

    formatOnSave = ''
      function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized style. You can add add/remove
        -- additional languages here.
        local disable_filetypes = { c = true, cpp = true }
        return {
          timeout_ms = 500,
          lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype]
        }
      end
    '';

    formattersByFt = {
      lua = [ "stylua" ];

      # conform can run multiple formatters sequentially
      python = [ "isort" "black" ];

      # use sublists to run *until* a formatter is found
      # javascript = [ [ "prettierd" "prettier" ] ];
    };
  };

  keymaps = [
    {
      mode = "";
      key = "<leader>f";
      action.__raw = ''
        function()
          require('conform').format { async = true, lsp_fallback = true }
        end
      '';
      options.desc = "[F]ormat buffer";
    }
  ];
}
