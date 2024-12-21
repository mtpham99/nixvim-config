# harpoon.nix
# plugin for quickly switching between files
# https://nix-community.github.io/nixvim/plugins/harpoon/index.html

{ config, ... }:

{
  plugins.harpoon = {
    enable = true;
    enableTelescope = config.plugins.telescope.enable;

    keymaps = {
      addFile = "<leader>ha";
      toggleQuickMenu = "<leader>hl";
    };
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
      key = "<leader>ha";
      action.__raw = "require('harpoon.mark').add_file";
      options.desc = "[a]dd mark";
    }
    {
      mode = "n";
      key = "<leader>hl";
      action.__raw = "require('harpoon.ui').toggle_quick_menu";
      options.desc = "toggle [l]ist";
    }
  ];
}
