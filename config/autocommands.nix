{
  ...
}:

{
  autoCmd = [
    {
      desc = "highlight yank";
      event = [ "TextYankPost" ];
      callback.__raw = ''
        function()
          vim.hl.on_yank()
        end
      '';
    }

    # see: https://vi.stackexchange.com/a/41388
    {
      desc = "trim trailing whitespace";
      event = [ "BufWritePre" ];
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
