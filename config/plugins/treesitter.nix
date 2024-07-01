# treesitter.nix
# plugin for tree-sitter (an incremental syntax parser) which allows efficient highlighting, editting, and navigation of code

{ ... }:

{
  plugins.treesitter = {
    enable = true;
    ensureInstalled = "all"; # [ "bash" "c" ... ];
    indent = true;
  };
}
