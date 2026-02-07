{
  description = "Ruby development environment";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable"
  }

  outputs =
    { self, ... }@inputs:

    let
      supportedSystems = [
        "aarch64-darwin"
        "x86_64-linux"
      ];
      forEachSupportedSystem =
        f:
        inputs.nixpkgs.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import inputs.nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSupportedSystem (
        { pkgs }:
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [ ruby_3_4 ];
          };
        }
      );
    };
}
