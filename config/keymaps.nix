# keymaps.nix

{ ... }:

{
  keymaps = [
    # explorer
    {
      mode = "n";
      key = "<leader>x";
      action = "<cmd>Ex<CR>";
      options.desc = "E[x]plorer";
    }

    # remove search highlights
    {
      mode = "n";
      key = "<Esc>";
      action = "<cmd>nohlsearch<CR>";
      options.desc = "Remove search highlights";
    }

    # exit terminal mode
    {
      mode = "t";
      key = "<Esc><Esc>";
      action = "<C-\\><C-n>";
      options.desc = "Exit terminal mode";
    }

    # split navigation
    # ctrl + <hjkl>
    {
      mode = "n";
      key = "<C-h>";
      action = "<C-w><C-h>";
      options.desc = "Move focus to left split";
    }
    {
      mode = "n";
      key = "<C-j>";
      action = "<C-w><C-j>";
      options.desc = "Move focus to bottom split";
    }
    {
      mode = "n";
      key = "<C-k>";
      action = "<C-w><C-k>";
      options.desc = "Move focus to top split";
    }
    {
      mode = "n";
      key = "<C-l>";
      action = "<C-w><C-l>";
      options.desc = "Move focus to right split";
    }

    # word wrap navigation
    {
      mode = "n";
      key = "j";
      action = "v:count == 0 ? 'gj' : 'j'";
      options = {
        expr = true;
        silent = true;
      };
    }
    {
      mode = "n";
      key = "k";
      action = "v:count == 0 ? 'gk' : 'k'";
      options = {
        expr = true;
        silent = true;
      };
    }
  ];
}
