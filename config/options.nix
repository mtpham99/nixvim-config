{
  termGuiColors ? false,
  haveNerdFont ? false,
  ...
}:

{
  globals = {
    mapleader = " ";
    maplocalleader = " ";

    have_nerd_font = haveNerdFont;
  };

  opts = {
    # line numbers
    number = true;
    relativenumber = true;

    # show current line
    cursorline = true;
    cursorlineopt = "both";

    # minimum lines above/below cursor
    scrolloff = 5;

    # sign column always shown
    signcolumn = "yes";

    # default tabs
    shiftwidth = 2;
    tabstop = 2;
    expandtab = true;
    smartindent = true;
    autoindent = true;

    # show whitespace
    list = true;
    listchars = "lead:\ ,trail:·,multispace:.,tab:»\ ,nbsp:␣,extends:»,precedes:«";

    # preview search/substitutions and highlight
    incsearch = true;
    inccommand = "nosplit";
    hlsearch = true;

    # case-insensitive search (unless uppercase included)
    ignorecase = true;
    smartcase = true;

    # don't show mode (will show in statusline plugin)
    showmode = false;

    # enable all mouse modes
    mouse = "a";

    # decrease update time
    updatetime = 200;
    timeoutlen = 250;

    # enable undo history
    undofile = true;

    # sync clipboard to system
    clipboard = {
      register = "unnamed,unnamedplus";
      providers = {
        wl-copy.enable = true; # wayland
        xsel.enable = true; # X11
      };
    };

    termguicolors = termGuiColors;
  };
}
