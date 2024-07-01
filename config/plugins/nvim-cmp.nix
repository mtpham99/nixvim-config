# nvim-cmp.nix
# plugin for autocompletion

{ ... }:

{
  # dependencies
  plugins = {
    luasnip.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;

    friendly-snippets.enable = true;
  };

  extraLuaPackages = ps: [
    # required by luasnip
    ps.jsregexp
  ];

  plugins.cmp = {
    enable = true;

    settings = {
      snipper = {
        expand = ''
          function(args)
            require('luasnip').lsp_expand(args.body)
          end
        '';
      };

      completion = {
        completeopt = "menu,menuone,noinsert";
      };

      mapping = {
        # select the [n]ext item
        "<C-n>" = "cmp.mapping.select_next_item()";
        # select the [p]revious item
        "<C-p>" = "cmp.mapping.select_prev_item()";
        # scroll the documentation window [d]own / [u]p
        "<C-u>" = "cmp.mapping.scroll_docs(-4)";
        "<C-d>" = "cmp.mapping.scroll_docs(4)";
        # accept ([y]es) the completion
        # this will auto-import if your LSP supports it
        # this will expand snippets if the LSP sent a snippet
        "<C-CR>" = "cmp.mapping.confirm { select = true }";
        # if you prefer more traditional completion keymaps,
        # you can uncomment the following lines.
        # "<cr>" = "cmp.mapping.confirm { select = true }";
        # "<tab>" = "cmp.mapping.select_next_item()";
        # "<s-tab>" = "cmp.mapping.select_prev_item()";

        # manually trigger a completion from nvim-cmp
        # generally you don't need this, because nvim-cmp will display
        # completions whenever it has completion options available
        "<C-Space>" = "cmp.mapping.complete {}";

        # Think of <c-l> as moving to the right of your snippet expansion.
        #  So if you have a snippet that's like:
        #  function $name($args)
        #    $body
        #  end
        #
        # <c-l> will move you to the right of the expansion locations.
        # <c-h> is similar, except moving you backwards.
        "<C-l>" = ''
          cmp.mapping(function()
            if luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            end
          end, { 'i', 's' })
        '';
        "<C-h>" = ''
          cmp.mapping(function()
            if luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            end
          end, { 'i', 's' })
        '';

        # for more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion)
        # see https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
      };

      sources = [
        { name = "luasnip"; }

        # other completion capabilities
        { name = "nvim_lsp"; }
        { name = "path"; }
      ];
    };
  };
}
