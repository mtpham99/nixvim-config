{
  ...
}:

{
  plugins.treesitter = {
    enable = true;
    settings = {
      ensure_installed = "all"; # [ "bash", "c" ... ]
      indent.enable = true;
    };
  };
}
