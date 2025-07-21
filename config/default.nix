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
}
