{
  description = "A basic flake with a shell";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.flake-utils.url = "github:numtide/flake-utils";

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        my_rstudio = pkgs.rstudioWrapper.override {
          packages = with pkgs.rPackages; [
            reticulate
          ];
        };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = [ my_rstudio ];
        };
        apps.default = {
          type = "app";
          program = "${my_rstudio}/bin/rstudio";
        };
      });
}
