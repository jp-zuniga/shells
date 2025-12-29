{
  description = "dev shells!";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";

  outputs = {
    self,
    nixpkgs,
  }: let
    systems = ["x86_64-linux"];

    forAllSystems = nixpkgs.lib.genAttrs systems;
    nixpkgsFor = forAllSystems (system: nixpkgs.legacyPackages.${system});
  in {
    devShells = forAllSystems (system: let
      pkgs = nixpkgsFor.${system};
    in {
      default = pkgs.mkShell {
        buildInputs = [
          # x
          pkgs.just

          # c/c++
          pkgs.clang-tools
          pkgs.clang
          pkgs.libclang
          pkgs.libcxx

          # python
          pkgs.ruff
          pkgs.ty
          pkgs.uv

          # rust
          pkgs.bacon
          pkgs.cargo
          pkgs.cargo-bump
          pkgs.clippy
          pkgs.rustc
          pkgs.rustfmt
        ];
      };

      cpp = pkgs.mkShell {
        buildInputs = [
          pkgs.clang-tools
          pkgs.clang
          pkgs.just
          pkgs.libclang
          pkgs.libcxx
        ];
      };

      py = pkgs.mkShell {
        buildInputs = [
          pkgs.just
          pkgs.ruff
          pkgs.ty
          pkgs.uv
        ];
      };

      rs = pkgs.mkShell {
        buildInputs = [
          pkgs.bacon
          pkgs.cargo
          pkgs.cargo-bump
          pkgs.clippy
          pkgs.just
          pkgs.rustc
          pkgs.rustfmt
        ];
      };
    });
  };
}
