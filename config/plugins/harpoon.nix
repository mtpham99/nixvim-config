# harpoon.nix
# plugin for quickly switching between files
# https://nix-community.github.io/nixvim/plugins/harpoon/index.html

{ config, ... }:

{
  plugins.harpoon = {
    enable = true;
    enableTelescope = config.plugins.telescope.enable;
    # keymaps = {
    #   addFile = "<leader>ha";
    #   toggleQuickMenu = "<leader>hl";
    # };
  };

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>h";
      group = "[H]arpoon";
    }
  ];

  keymaps = [
    {
      mode = "n";
      key = "<leader>hl";
      action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end";
      options.desc = "toggle [l]ist";
    }
    {
      mode = "n";
      key = "<leader>ha";
      action.__raw = "function() require'harpoon':list():add() end";
      options.desc = "[a]dd mark";
    }
  ];
}
