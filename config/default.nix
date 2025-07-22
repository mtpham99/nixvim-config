{
  ...
}:

{
  imports = [
    (import ./options.nix {
      haveNerdFont = true;
      termGuiColors = true;
    })
    ./autocommands.nix
    ./keymaps.nix
  ];

  # extra lua config added at top and bottom of init.lua
  extraConfigLuaPre = '''';
  extraConfigLuaPost = '''';

  # lz-n plugin for lazy loading other plugins
  # see: https://nix-community.github.io/nixvim/plugins/lz-n/index.html
  #      https://github.com/nvim-neorocks/lz.n
  plugins.lz-n.enable = true;

  performance = {
    # see: https://nix-community.github.io/nixvim/performance/byteCompileLua.html
    byteCompileLua = {
      enable = true;
      configs = true;
      initLua = true;
      luaLib = true;
      nvimRuntime = true;
      plugins = true;
    };

    # see: https://nix-community.github.io/nixvim/performance/combinePlugins.html
    combinePlugins.enable = true;
  };
}
