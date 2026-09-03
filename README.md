# halley-flake

Nix flake for [Halley](https://github.com/saltnpepper97/halley) — spatial Wayland compositor.

## Usage

```nix
{
  inputs.halley.url = "github:binarylinuxx/halley-flake";
}
```

### Cachix

Prebuilt Linux packages are published to the public `halley-flake` Cachix cache. Configure it once before installing or building:

```bash
nix run nixpkgs#cachix -- use halley-flake # for a temporary running attempt
```

For a declarative NixOS setup, add the cache to your system configuration:

```nix
{
  nix.settings = {
    extra-substituters = [ "https://halley-flake.cachix.org" ];
    extra-trusted-public-keys = [
      "halley-flake.cachix.org-1:Hj1ONksQG9XGr8cHCrsW21GNpYCYJ2E2znKUjPzuoTI="
    ];
  };
}
```

```bash
nix build .#halley-stable      # v0.4.0 release
nix build .#halley-unstable    # latest main branch
nix build .#default            # same as unstable
```

## Packages

| Package | Source | Extras |
|---|---|---|
| `halley-stable` | release tag | halley, halleyctl |
| `halley-unstable` | main branch | + xdg-desktop-portal-halley |
| `halley-unstable-dev` | main branch | + xdg-desktop-portal-halley |

Both install session files, systemd units, portal config, and D-Bus services.

## Install

### NixOS (flake)

```nix
{
  inputs.halley.url = "github:binarylinuxx/halley-flake";

  outputs = { self, nixpkgs, halley, ... }: {
    nixosConfigurations.mybox = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        halley.nixosModules.default
        {
          programs.halley = {
            enable = true;
            package = halley.packages.${pkgs.system}.halley-unstable; # optional, defaults to unstable
          };
        }
      ];
    };
  };
}
```

### User profile (non-NixOS)

```bash
nix run nixpkgs#cachix -- use halley-flake
nix profile install github:binarylinuxx/halley-flake#halley-unstable
```

After installation, select **Halley** from your display manager session list, or run `halley-session` from a TTY.

### Home Manager

Import the Home Manager module to install Halley and generate `~/.config/halley/halley.rune`:

```nix
{
  imports = [ inputs.halley.homeModules.default ];

  programs.halley = {
    enable = true;
    settings = {
      autostart.once = [ "blxshell" "waybar" ];
      cursor = {
        theme = "Bibata-Modern-Classic";
        size = 24;
      };
      keybinds = {
        mod = "super";
        "$var.mod+return" = "open-terminal";
      };
    };
  };
}
```

Nested attribute sets become Rune blocks. Lists of values become Rune arrays, while lists of attribute sets become repeated blocks, such as `rules.rule`. `autostart.once`, `autostart.on-reload`, root `gather`, and keybind values accept arrays and render one directive per item. Use `__raw` for Rune syntax that must not be quoted, such as regex arrays: `title.__raw = ''[r"File Upload.*"]'';`.

`programs.halley.config` accepts a raw Rune string and overrides `settings`.

`settings` is checked against the schema attached to `programs.halley.package`: stable, unstable, or development. Dynamic namespaces accepted by Halley, including outputs, devices, bindings, environment variables, rules, and game profiles, remain open for their user-defined names.

`sample.rune.nix` is a larger Home Manager example covering nested settings, viewports, rules, bindings, and Gamescope.

### Schema Extraction

The flake exports `inputs.halley.lib.halley.schemas.stable`, `.unstable`, and `.dev`; `.default` currently aliases unstable. Regenerate a schema with the flake app:

```bash
nix run .#extract-halley-schema -- /path/to/validate.rs halley-schema-unstable.nix
```

> [!NOTE]
> The unstable and dev packages are recommended for users who want the latest fixes, since Halley currently moves fast and releases may lag behind those fixes.

# CONTRIBUTION 
For contributing you must fork this repo and setup separated branch before submitting pull request for cachix required GitHub secret variable