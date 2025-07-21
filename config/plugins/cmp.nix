{
  config,
  lib,
  ...
}:

{
  plugins = {
    # snippet engine
    luasnip.enable = true;
    cmp_luasnip.enable = true;

    # vscode like snippets for multiple languages
    # auto loaded by luasnip
    friendly-snippets.enable = true;

    # neovim source
    cmp-nvim-lsp.enable = true;

    # paths source
    cmp-path.enable = true;

    # current buffer source
    cmp-buffer.enable = true;

    # treesitter source
    cmp-treesitter.enable = config.plugins.treesitter.enable;

    cmp = {
      enable = true;

      settings = {
        sources = [
          { name = "luasnip"; }
          { name = "nvim_lsp"; }
          { name = "path"; }
          { name = "buffer"; }
          (lib.mkIf config.plugins.treesitter.enable { name = "treesitter"; })
        ];

        snippet.expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item";
          "<C-p>" = "cmp.mapping.select_prev_item";
          "<C-Space>" = "cmp.mapping.complete";
        };
      };
    };
  };
}
