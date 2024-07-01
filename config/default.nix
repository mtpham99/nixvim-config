# default.nix

{ ... }:

{
  imports = [
    ./options.nix
    ./keymaps.nix
    ./autocommands.nix
    ./theme.nix

    ./plugins
  ];
}
