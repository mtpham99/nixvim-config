# mini.nix
# mini plugin is a collection of many different small independent plugins/modules
# see all plugins/modules at: https://github.com/echasnovski/mini.nvim

{ ... }:

{
  plugins.mini = {
    enable = true;

    modules = {
      # better around/inside textobjects
      #
      # examples:
      #  - va)  - [V]isually select [A]round [)]paren
      #  - yinq - [Y]ank [I]nside [N]ext [']quote
      #  - ci'  - [C]hange [I]nside [']quote
      ai = {
        n_lines = 500;
      };

      # add/delete/replace surroundings (brackets, quotes, etc.)
      #
      # examples:
      #  - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
      #  - sd'   - [S]urround [D]elete [']quotes
      #  - sr)'  - [S]urround [R]eplace [)] [']
      surround = {
      };

      # simple and easy statusline
      # you could remove this setup call if you don't like it,
      # and try some other statusline plugin
      statusline = {
        use_icons.__raw = "vim.g.have_nerd_font";
      };
    };
  };
}
