{
  description = "mtpham99's neovim (via nixvim) config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    treefmt-nix.url = "github:numtide/treefmt-nix";
    nixvim.url = "github:nix-community/nixvim";
  };

  outputs =
    {
      self,
      nixpkgs,
      treefmt-nix,
      nixvim,
    }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      pkgsFor = system: import nixpkgs { inherit system; };
      forAllSystems = fn: nixpkgs.lib.genAttrs supportedSystems (system: fn (pkgsFor system));

      treefmtEvalFor = system: treefmt-nix.lib.evalModule (pkgsFor system) ./treefmt.nix;

      nixvimModuleFor = system: {
        inherit system;
        module = import ./config;
        extraSpecialArgs = {
          # inherit (inputs) foo;
        };
      };
      nvimFor = system: nixvim.legacyPackages.${system}.makeNixvimWithModule (nixvimModuleFor system);
    in
    {
      # `nix run`
      packages = forAllSystems (
        pkgs:
        let
          nvim = nvimFor pkgs.system;
        in
        {
          inherit nvim;
          default = nvim;
        }
      );

      # `nix flake check`
      checks = forAllSystems (
        pkgs:
        let
          nvimCheck = nixvim.lib.${pkgs.system}.check.mkTestDerivationFromNixvimModule (
            nixvimModuleFor pkgs.system
          );
        in
        {
          formatting = (treefmtEvalFor pkgs.system).config.build.check self;
          inherit nvimCheck;
          default = nvimCheck;
        }
      );

      # `nix fmt`
      formatter = forAllSystems (pkgs: (treefmtEvalFor pkgs.system).config.build.wrapper);
    };
}
