{
  description = "A very basic flake";

  inputs = { nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable"; };

  outputs = { self, nixpkgs }:
    let pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in {
      devShells.x86_64-linux.default =
        pkgs.mkShell { packages = [ pkgs.ncurses pkgs.gnumake pkgs.gcc ]; };

      packages.x86_64-linux = {
        default = self.packages.x86_64-linux.hello-tutorialtag;

        hello-tutorialtag = pkgs.callPackage ({ ncurses, stdenv }:
          stdenv.mkDerivation {
            name = "hello-tutorialtag";
            src = pkgs.lib.cleanSource ./.;
            buildInputs = [ ncurses ];
            installPhase = "mkdir -p $out/bin; cp hello $out/bin";
            meta.mainProgram = "hello";
          }) { };
      };
    };
}
