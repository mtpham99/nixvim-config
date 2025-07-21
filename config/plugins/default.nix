{
  config,
  ...
}:

{
  imports = [
    ./treesitter.nix
    ./telescope.nix
    ./lsp.nix
    ./cmp.nix

    ./gitsigns.nix
  ];

  # simple plugins without much configuration
  plugins = {
    # display available keymaps while typing
    which-key = {
      enable = true;
      lazyLoad.settings.event = "VimEnter";
      settings = {
        delay = 0;
        icons.mappings = config.globals.have_nerd_font;
      };
    };

    # auto match open and closing characters
    nvim-autopairs.enable = true;

    # tree viewer for undo history
    undotree.enable = true;

    # smart comments
    # comment visual group ('gc'), auto detect comment string, etc.
    comment.enable = true;

    # highlight 'todo', 'note', etc in comments
    todo-comments.enable = true;

    # auto detect indentation style
    guess-indent.enable = true;

    # indent line guides
    indent-blankline.enable = true;

    # nerd font icons
    web-devicons.enable = config.globals.have_nerd_font;
  };
}
