# Nix from Scratch
## Beispielprojekt
### Ohne Nix

Braucht `gcc`, `ncurses`, `gnumake`, evtl. müssen Pfade im
[Makefile](./Makefile) angepasst werden.

- `make`
- `make clean` zum Säubern

## Mit Nix

- `nix build` -> erstellt `result`-Symlink
- `nix run` -> führt `default`-Package sofort aus
- `nix develop` -> betritt `default`-Dev-Shell

Siehe zur Definition der Outputs [flake.nix](./flake.nix).

Alternativ ist es möglich, ein Development-Shell für ein bestimmtes `package` zu
bekommen. Diese enthält alles, was zur Build-Zeit des Pakets Nix auch zur
Verfügung steht:

```shell
nix develop .#hello-tutorialtag`
```

Das benutzt den Output `packages.x86_64-linux.hello-tutorialtag`, um daraus eine
Shell mit `ncurses` und dem `stdenv` (hier: `gcc` und `make`) zu generieren.
