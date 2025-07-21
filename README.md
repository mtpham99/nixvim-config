# nixvim-config

My [Neovim](https://neovim.io/) (via [Nixvim](https://github.com/nix-community/nixvim)) config made available as a [Nix Flake](https://wiki.nixos.org/wiki/Flakes).

## How To

Requires [Nix/NixOS](https://nixos.org/) w/ [Flakes](https://wiki.nixos.org/wiki/Flakes) support.

### Try Configs Without Installing

You can try the configs without installing using `nix run ...`:

```sh
nix run github:mtpham99/nixvim-config
```

### NixOS/Home-Manager (w/ Flakes) Package Install

In your `flake.nix`, add the flake for these configs to your `inputs`:

```nix
# flake.nix
{
  inputs = {
    nixvim-config.url = "github:mtpham99/nixvim-config";
  };

  outputs = { ... } @ inputs: { ... };
}
```

In your NixOS/Home-Manager config, install the package:

```nix
# NixOS: configuration.nix
{ pkgs, inputs, ... }:

{
  environment.systemPackages = [
    inputs.nixvim-config.packages.${pkgs.system}.default
  ];
}

# Home-Manager: home.nix
{ pkgs, inputs, ... }:

{
  home.packages = [
    inputs.nixvim-config.packages.${pkgs.system}.default
  ];
}
```
