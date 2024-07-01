# My neovim (via nixvim) config

## Usage

If you have the nix package manager installed with flakes support, you can test drive this config using:

```sh
nix run github:mtpham99/nixvim-config
```

Otherwise, you can install add this to your own flake:

```
# flake.nix
{
  inputs = {
    nixvim-config = {
      url = github:mtpham99/nixvim-config;
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  
  ...
  
  outputs = { ... } @ inputs: {
    ...
  };
}
```

Then install using either home-manager or NixOS module:

```
# NixOS module
# configuration.nix
{ pkgs, inputs, ... }: {

  ... 

  environment.systemPackages = [
    inputs.nixvim-config.packages."${pkgs.system}".default
  ]

  ...
}

# Home-Manager module
# home.nix
{ pkgs, inputs, ... }: {

  ...

  home.packages = [
    inputs.nixvim-config.packages."${pkgs.system}".default
  ];

  ...
}
```

## Credits
Thanks to all the maintainers at [nixvim](https://github.com/nix-community/nixvim) for the very convenient tool!

Thanks to [@JMartJonesy](https://github.com/JMartJonesy/kickstart.nixvim) for creating a nixvim implementation of [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim), which this is heavily based off!
