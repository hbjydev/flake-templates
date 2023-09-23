{
  inputs = {
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/0.1.0.tar.gz";
    devenv.url = "github:cachix/devenv";
  };

  nixConfig = {
    extra-trusted-public-keys = "devenv.cachix.org-1:w1cLUi8dv3hnoSPGAuibQv+f9TZLr6cv/Hm9XgU50cw=";
    extra-substituters = "https://devenv.cachix.org";
  };

  outputs = inputs@{ flake-parts }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [ inputs.devenv.flakeModule ];
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      perSystem = { pkgs, ... }: {
        devenv.shells.default = {
          packages = with pkgs; [
            golangci-lint
          ];

          languages.go = {
            enable = true;
            package = pkgs.go_1_21;
          };
        };
      };
    };
}
