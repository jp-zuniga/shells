{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.clang-tools
    pkgs.clang
    pkgs.just
    pkgs.libclang
    pkgs.libcxx
  ];
}
