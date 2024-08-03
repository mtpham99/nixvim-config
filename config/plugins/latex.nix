# latex.nix
# vimtex plugin for LaTeX files

{ pkgs, ... }:
# let
#   tex-package = (pkgs.texlive.combine {
#     inherit (pkgs.texlive) scheme-medium
#       preprint; # provides fullpage.sty
#   });
# in
{
  plugins.vimtex = {
    enable = true;

    # texlive package
    # default: pkgs.texlive-combined-medium-2023-final
    # adding extra packages
    # texlivePackage = with pkgs; [ tex-package ];
    texlivePackage = null; # don't install texlive

    settings = {
      view_method = "general"; # will use "xdg-open"
      compiler_method = "latexmk";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>ll";
      action = "<Cmd>VimtexCompile<CR>";
      options.desc = "vimtex compile all";
    }

    {
      mode = "n";
      key = "<leader>lL";
      action = "<Cmd>update<CR><Cmd>VimtexCompileSelected<CR>";
      options.desc = "vimtex compile selected";
    }

    {
      mode = "n";
      key = "<leader>li";
      action = "<Cmd>VimtexInfo<CR>";
      options.desc = "vimtex info";
    }

    {
      mode = "n";
      key = "<leader>lI";
      action = "<Cmd>VimtexInfo!<CR>";
      options.desc = "vimtex info full";
    }

    {
      mode = "n";
      key = "<leader>lt";
      action = "<Cmd>VimtexTocOpen<CR>";
      options.desc = "vimtex toc";
    }

    {
      mode = "n";
      key = "<leader>lT";
      action = "<Cmd>VimtexTocToggle<CR>";
      options.desc = "vimtex toggle toc";
    }

    {
      mode = "n";
      key = "<leader>lq";
      action = "<Cmd>VimtexLog<CR>";
      options.desc = "vimtex log";
    }

    {
      mode = "n";
      key = "<leader>lv";
      action = "<Cmd>VimtexView<CR>";
      options.desc = "vimtex view";
    }

    {
      mode = "n";
      key = "<leader>lr";
      action = "<plug>(Vimtex-reverse-search)";
      options.desc = "vimtex reverse search";
    }

    {
      mode = "n";
      key = "<leader>lk";
      action = "<Cmd>VimtexStop<CR>";
      options.desc = "vimtex stop";
    }

    {
      mode = "n";
      key = "<leader>lK";
      action = "<Cmd>VimtexStopAll<CR>";
      options.desc = "vimtex stop all";
    }

    {
      mode ="n";
      key = "<leader>le";
      action = "<Cmd>VimtexErrors<CR>";
      options.desc = "vimtex errors";
    }

    {
      mode = "n";
      key = "<leader>lo";
      action = "<Cmd>VimtexCompileOutput<CR>";
      options.desc = "vimtex compile output";
    }

    {
      mode = "n";
      key = "<leader>lg";
      action = "<Cmd>VimtexStatus<CR>";
      options.desc = "vimtex status";
    }

    {
      mode = "n";
      key = "<leader>lG";
      action = "<Cmd>VimtexStatus!<CR>";
      options.desc = "vimtex full status";
    }

    {
      mode = "n";
      key = "<leader>lc";
      action = "<Cmd>VimtexClean<CR>";
      options.desc = "vimtex clean";
    }

    {
      mode = "n";
      key = "<leader>lC";
      action = "<Cmd>VimtexClean!<CR>";
      options.desc = "vimtex full clean";
    }

    {
      mode = "n";
      key = "<leader>lx";
      action = "<Cmd>VimtexReload<CR>";
      options.desc = "vimtex reload";
    }

    {
      mode = "n";
      key = "<leader>lX";
      action = "<Cmd>VimtexReloadState<CR>";
      options.desc = "vimtex reload state";
    }

    {
      mode = "n";
      key = "<leader>lm";
      action = "<Cmd>VimtexImapsList<CR>";
      options.desc = "vimtex input maps list";
    }

    {
      mode = "n";
      key = "<leader>ls";
      action = "<Cmd>VimtexToggleMain<CR>";
      options.desc = "vimtex toggle main";
    }

    {
      mode = "n";
      key = "<leader>la";
      action = "<Cmd>VimtexContextMenu<CR>";
      options.desc = "vimtex context menu";
    }
  ];

  plugins.which-key.settings.spec = [
    {
      __unkeyed-1 = "<leader>l";
      group = "[L]aTeX";
    }
  ];
}
