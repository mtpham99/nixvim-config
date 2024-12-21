# which-key.nix
# plugin for showing pending keybinds
# https://nix-community.github.io/nixvim/plugins/which-key/index.html

{ ... }:

{
  plugins.which-key = {
    enable = true;

    # existing keybinds
    settings.spec = [
      {
        __unkeyed-1 = "<leader>c";
        group = "[C]ode";
      }
      {
        __unkeyed-1 = "<leader>d";
        group = "[D]ocument";
      }
      {
        __unkeyed-1 = "<leader>r";
        group = "[R]ename";
      }
      {
        __unkeyed-1 = "<leader>s";
       group = "[S]earch";
      }
      {
        __unkeyed-1 = "<leader>w";
        group = "[W]orkspace";
      }
      {
        __unkeyed-1 = "<leader>t";
        group = "[T]oggle";
      }
      {
        __unkeyed-1 = "<leader>g";
        group = "[G]it Hunk";
      }
    ];
  };
}
