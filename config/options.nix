# options.nix

{ ... }:

{
  # global options
  globals = {
    # set <space> as leader key
    # see `:help mapleader`
    mapleader = " ";
    maplocalleader = " ";

    # set to true if using a terminal nerd font
    have_nerd_font = true;
  };

  # local options
  opts = {
    # tabs
    expandtab = false;
    tabstop = 4;
    shiftwidth = 4;

    # enable break indent
    breakindent = true;

    # line numbers
    number = true;
    relativenumber = true;

    # enable mouse mode
    mouse = "a";

    # disable showing mode (will show in statusline)
    showmode = false;

    # sync neovim and os clipboard
    clipboard = "unnamedplus";
 
    # save undo history
    undofile = true;

    # case-insensitive search unless search includes capital letter
    ignorecase = true;
    smartcase = true;

    # keep signcolumn on
    signcolumn = "yes";

    # decrease update time
    updatetime = 200;
    timeoutlen = 250;

    # configure how new splits open
    splitright = true;
    splitbelow = true;

    # set whitespace is displayed
    # see `:help 'list'`
    # see `:help 'listchars'`
    list = true;
    listchars.__raw = "{ tab = '» ', trail = '·', nbsp = '␣' }";

    # preview subsitutions
    inccommand = "split";

    # highlight current line
    cursorline = true;

    # minimum number of lines to keep above and below cursor
    scrolloff = 5;

    # highlight search matches
    hlsearch = true;
  };
}
