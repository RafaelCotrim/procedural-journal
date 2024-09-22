{
  description = "hello-world flake";

  inputs =
    {
      nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    };

  outputs = { self, nixpkgs }:
  let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in
  {
    packages.${system}.default = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
        nodejs_22
      ];
    }; # (import ./default.nix { inherit pkgs; });
  };
}