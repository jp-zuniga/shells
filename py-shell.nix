{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  buildInputs = [
    pkgs.ruff
    pkgs.ty
    pkgs.uv
  ];
}
