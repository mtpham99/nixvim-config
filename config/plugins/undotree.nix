# undotree.nix
# undotree plugin for viewing undo history
# https://nix-community.github.io/nixvim/plugins/undotree.html

{ ... }:

{
  plugins.undotree = {
    enable = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>U";
      action = "<Cmd>UndotreeToggle<CR>";
      options.desc = "[U]ndo Tree";
    }
  ];
}
