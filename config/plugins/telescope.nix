{
  config,
  lib,
  ...
}:

{
  plugins.telescope = {
    enable = true;
    lazyLoad.settings.event = "VimEnter";

    extensions = {
      # fuzzy search algorithm
      fzf-native.enable = true;

      # set nvim ui selecter to telescope
      ui-select.enable = true;
    };

    settings.extensions.__raw = ''
      { ['ui-select'] = { require('telescope.themes').get_dropdown() } }
    '';

    keymaps = {
      "<leader>s/" = {
        options.desc = "[/] fuzzy find current buffer";
        mode = "n";
        action = "current_buffer_fuzzy_find";
      };

      "<leader>sg" = {
        options.desc = "[g]rep current directory";
        mode = "n";
        action = "live_grep";
      };

      "<leader>sb" = {
        options.desc = "[b]uffers";
        mode = "n";
        action = "buffers";
      };

      "<leader>sf" = {
        options.desc = "[f]iles";
        mode = "n";
        action = "find_files";
      };

      "<leader>ss" = {
        options.desc = "[s]elect";
        mode = "n";
        action = "builtin";
      };

      "<leader>sk" = {
        options.desc = "[k]eymaps";
        mode = "n";
        action = "keymaps";
      };

      "<leader>sh" = {
        options.desc = "[h]elp";
        mode = "n";
        action = "help_tags";
      };
    };
  };

  plugins.which-key = lib.mkIf config.plugins.which-key.enable {
    settings.spec = [
      {
        group = "[s]earch";
        mode = "n";
        __unkeyed = "<leader>s";
      }
    ];
  };
}
