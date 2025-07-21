{
  config,
  lib,
  ...
}:

{
  plugins.gitsigns = {
    enable = true;

    settings = {
      signs = {
        add.text = "+";
        change.text = "~";
        delete.text = "_";
        topdelete.text = "‾";
        changedelete.text = "~";
        untracked.text = "┆";
      };

      current_line_blame = true;

      attach_to_untracked = true;

      # buffer keymaps on attach
      # see: https://github.com/lewis6991/gitsigns.nvim#-keymaps
      on_attach.__raw = ''
        function(bufnr)
          local gitsigns = require('gitsigns')

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          -- navigation
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end, { desc = 'previous git [c]hange' })
          map('n', ']c', function()
            if vim.wo.diff then
              vim.cmd.normal({']c', bang = true})
            else
              gitsigns.nav_hunk('next')
            end
          end, { desc = 'next git [c]hange' })

          -- actions
          map('v', '<leader>gs', function()
            gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') });
          end, { desc = '[s]tage hunk' })
          map('v', '<leader>gr', function()
            gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') });
          end, { desc = '[r]eset hunk' })

          map('n', '<leader>gs', gitsigns.stage_hunk, { desc = '[s]tage hunk' })
          map('n', '<leader>gr', gitsigns.reset_hunk, { desc = '[r]eset hunk' })

          map('n', '<leader>gS', gitsigns.stage_hunk, { desc = '[S]tage buffer' })
          map('n', '<leader>gR', gitsigns.reset_buffer, { desc = '[R]eset buffer' })

          map('n', '<leader>gp', gitsigns.preview_hunk, { desc = '[p]review hunk' })
          map('n', '<leader>gi', gitsigns.preview_hunk_inline, { desc = 'preview hunk [i]nline' })

          map('n', '<leader>gd', gitsigns.diffthis, { desc = '[d]iff index' })
          map('n', '<leader>gD', function()
            gitsigns.diffthis('@')
          end, { desc = '[d]iff last commit' })

          -- toggle
          map('n', '<leader>gtd', gitsigns.toggle_deleted, { desc = '[d]eleted' });
          map('n', '<leader>gtb', gitsigns.toggle_current_line_blame, { desc = '[b]lame' });
        end
      '';
    };
  };

  plugins.which-key = lib.mkIf config.plugins.which-key.enable {
    settings.spec = [
      {
        group = "[g]it";
        mode = [
          "n"
          "v"
        ];
        __unkeyed = "<leader>g";
      }
      {
        group = "[t]oggle";
        mode = "n";
        __unkeyed = "<leader>gt";
      }
    ];
  };
}
