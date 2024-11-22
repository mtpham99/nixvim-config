# autocommands.nix

{ ... }:

{
  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = {
    highlight-yank = {
      clear = true;
    };
  };

  autoCmd = [
    # highlight when yanking
    {
      event = [ "TextYankPost" ];
      desc = "Highlight when yanking";
      group = "highlight-yank";
      callback.__raw = ''
        function()
          vim.highlight.on_yank()
        end
      '';
    }

    # trim trailing white space
    # credit to: https://vi.stackexchange.com/a/41388
    {
      event = [ "BufWritePre" ];
      desc = "Trim trailing whitespace";
      pattern = [ "*" ];
      callback.__raw = ''
        function()
          local save_cursor = vim.fn.getpos(".")
          pcall(function() vim.cmd [[%s/\s\+$//e]] end)
          vim.fn.setpos(".", save_cursor)
        end
      '';
    }
  ];
}
