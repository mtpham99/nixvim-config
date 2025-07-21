{
  ...
}:

{
  keymaps = [
    {
      key = "<leader>x";
      options.desc = "file e[x]plorer";
      mode = "n";
      action = "<cmd>Ex<CR>";
    }

    {
      key = "<Esc>";
      options.desc = "clear search highlights";
      mode = "n";
      action = "<cmd>nohlsearch<CR>";
    }

    {
      key = "<Esc><Esc>";
      options.desc = "exit terminal mode";
      mode = "t";
      action = "<C-\\><C-n>";
    }

    # word wrap navigation
    {
      key = "j";
      mode = "n";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        expr = true;
        silent = true;
      };
    }
    {
      key = "k";
      mode = "n";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        expr = true;
        silent = true;
      };
    }

    # split navigation
    {
      key = "<C-h>";
      options.desc = "move focus to left split";
      mode = "n";
      action = "<C-w><C-h>";
    }
    {
      key = "<C-j>";
      options.desc = "move focus to bottom split";
      mode = "n";
      action = "<C-w><C-j>";
    }
    {
      key = "<C-k>";
      options.desc = "move focus to top split";
      mode = "n";
      action = "<C-w><C-k>";
    }
    {
      key = "<C-l>";
      options.desc = "move focus to right split";
      mode = "n";
      action = "<C-w><C-l>";
    }
  ];
}
