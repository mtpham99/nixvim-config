# autocommands.nix

{ ... }:

{
  # https://nix-community.github.io/nixvim/NeovimOptions/autoGroups/index.html
  autoGroups = {
    highlight-yank = {
      clear= true;
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
  ];
}
