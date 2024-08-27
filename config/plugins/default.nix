# default.nix (plugins)

{ pkgs, ... }:

{
  imports = [
    ./which-key.nix
    ./conform.nix
    ./gitsigns.nix
    ./lsp.nix
    ./nvim-cmp.nix
    ./mini.nix
    ./telescope.nix
    ./treesitter.nix
    ./latex.nix
    ./markdown.nix
  ];

  # simple nixvim plugins
  plugins = {
    # detect tabstop and shiftwidth automatically
    # https://nix-community.github.io/nixvim/plugins/sleuth/index.html
    sleuth = {
      enable = true;
    };

    # comment visual lines with "gc"
    # https://nix-community.github.io/nixvim/plugins/comment/index.html
    comment = {
      enable = true;
    };

    # highlight todo, notes, etc in comments
    # https://nix-community.github.io/nixvim/plugins/todo-comments/index.html
    todo-comments = {
      enable = true;
      settings = {
        signs = true;
      };
    };

    # indent guides
    # https://nix-community.github.io/nixvim/plugins/indent-blankline/index.html
    indent-blankline = {
      enable = true;
    };
  }; 

  # simple vim plugins
  extraPlugins = with pkgs.vimPlugins; [
    # nice looking icons (requires nerd font)
    nvim-web-devicons
  ];

  extraConfigLuaPre = ''
    if vim.g.have_nerd_font then
      require('nvim-web-devicons').setup {}
    end
  '';

  # modeline
  # see `:help modeline`
  # https://nix-community.github.io/nixvim/NeovimOptions/index.html?highlight=extraplugins#extraconfigluapost
  extraConfigLuaPost = ''
    -- vim: ts=2 sts=2 sw=2 et
  '';
}
