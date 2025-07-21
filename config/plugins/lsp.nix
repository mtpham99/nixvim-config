{
  config,
  lib,
  ...
}:

{
  # status/progress messages for lsp
  plugins.fidget.enable = true;

  # configures luals for editing neovim config
  plugins.lazydev.enable = true;

  plugins.lsp = {
    enable = true;

    servers = {
      nixd.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      pylsp.enable = true;
      bashls.enable = true;
      ansiblels.enable = true;
      dockerls.enable = true;
      docker_compose_language_service.enable = true;
      jsonls.enable = true;
      yamlls.enable = true;
      sqls.enable = true;
    };

    onAttach = ''
      -- taken from 'kickstart nvim'
      -- see: https://github.com/nvim-lua/kickstart.nvim/blob/master/init.lua#L588
      --
      -- The following two autocommands are used to highlight references of the
      -- word under the cursor when your cursor rests there for a little while.
      --    See `:help CursorHold` for information about when this is executed
      --
      -- When you move your cursor, the highlights will be cleared (the second autocommand).
      if client and client.server_capabilities.documentHighlightProvider then
        local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
          buffer = bufnr,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd('LspDetach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
          end,
        })
      end
    '';

    keymaps = {
      lspBuf = {
        "<leader>rn" = {
          desc = "[r]e[n]ame";
          mode = "n";
          action = "rename";
        };

        "<leader>ca" = {
          desc = "[c]ode [a]ction";
          mode = "n";
          action = "code_action";
        };

        "<leader>jD" = {
          desc = "[D]eclaration";
          mode = "n";
          action = "declaration";
        };

        "K" = {
          desc = "hover docs";
          mode = "n";
          action = "hover";
        };
      };

      diagnostic = {
        "<leader>E" = {
          desc = "[E]rror messages";
          mode = "n";
          action = "open_float";
        };

        "<leader>Q" = {
          desc = "[Q]uickfix list";
          mode = "n";
          action = "setloclist";
        };

        "[d" = {
          desc = "[d]iagnostic";
          mode = "n";
          action = "goto_prev";
        };

        "]d" = {
          desc = "[d]iagnostic";
          mode = "n";
          action = "goto_next";
        };
      };

      extra = [
        {
          key = "<leader>sr";
          options.desc = "[r]eferences";
          mode = "n";
          action.__raw = ''
            function()
              require('telescope.builtin').lsp_references();
            end
          '';
        }

        {
          key = "<leader>jd";
          options.desc = "[d]efinition";
          mode = "n";
          action.__raw = ''
            function()
              require('telescope.builtin').lsp_definitions();
            end
          '';
        }

        {
          key = "<leader>sy";
          options.desc = "document s[y]mbols";
          mode = "n";
          action.__raw = ''
            function()
              require('telescope.builtin').lsp_document_symbols();
            end
          '';
        }

        {
          key = "<leader>sY";
          options.desc = "workspace s[Y]mbols";
          mode = "n";
          action.__raw = ''
            function()
              require('telescope.builtin').lsp_dynamic_workspace_symbols();
            end
          '';
        }

        {
          key = "<leader>jt";
          options.desc = "[t]ype definition";
          mode = "n";
          action.__raw = ''
            function()
              require('telescope.builtin').lsp_type_definitions();
            end
          '';
        }
      ];
    };
  };

  plugins.which-key = lib.mkIf config.plugins.which-key.enable {
    settings.spec = [
      {
        group = "[j]ump to";
        mode = "n";
        __unkeyed = "<leader>j";
      }
      {
        group = "[s]earch";
        mode = "n";
        __unkeyed = "<leader>s";
      }
    ];
  };
}
