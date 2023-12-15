{
  inputs.nixpkgs.url = "github:nixos/nixpkgs/release-23.11";

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = inputs.nixpkgs.lib.systems.flakeExposed;

      perSystem = { self', pkgs, ... }:
      let
        name = "example";
        version' = "0.1.0";

        pythonSource = pkgs.python311Packages;
        python = pythonSource.python;
        pythonPackages = python.pkgs;
      in
      {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            just
          ];
          #inputsFrom = [ self'.packages.default ];
        };

        packages = {
          default = pythonSource.buildPythonApplication {
            pname = "${name}-django";
            version = version';
            nativeBuildInputs = with pythonPackages; [ setuptools wheel ];
            propagatedBuildInputs = with pythonPackages; [ django ];
            DJANGO_SETTINGS_MODULE = "example.settings";
            buildInputs = with pythonPackages; [ pip ];
            src = ./.;
          };
        };
      };
    };
}
