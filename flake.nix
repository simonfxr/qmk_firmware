{
  description = "QMK firmware development shell with ARM toolchain and QMK CLI";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      {
        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
            qmk
            gcc-arm-embedded
            python3
            dfu-util
            dfu-programmer
            avrdude
            hidapi
            pkg-config
            git
          ];
          shellHook = ''
            export QMK_HOME="$PWD"
          '';
        };
      }
    );
}
