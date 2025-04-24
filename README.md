# NixOS Configuration

![NixOS](https://img.shields.io/badge/NixOS-5277C3?style=for-the-badge&logo=nixos&logoColor=white)
![Flakes](https://img.shields.io/badge/Nix_Flakes-5277C3?style=flat-square&logo=nixos&logoColor=white)
![Home Manager](https://img.shields.io/badge/Home_Manager-41BDF5?style=flat-square&logo=nixos&logoColor=white)
![License](https://img.shields.io/badge/license-MIT-blue.svg)

A modular NixOS configuration using Flakes and Home Manager for multiple machines.

## Overview

This repository contains a complete NixOS configuration setup with support for multiple machines (desktop, laptop, server) and user-specific home configurations using Home Manager. The configuration uses NixOS Flakes for reproducible builds and dependency management.

## System Configurations

| Hostname    | Type    | Description                               |
| ----------- | ------- | ----------------------------------------- |
| `laptopUni` | Laptop  | University laptop with Wayland (Hyprland) |
| `desktop`   | Desktop | Home desktop setup                        |
| `server`    | Server  | Home server configuration                 |

## Features

- 🔄 **Modular Design**: Common configurations shared across machines
- 🏠 **Home Manager Integration**: User-specific configurations for different machines
- 🧩 **Custom Neovim**: Uses a custom nixvim configuration
- 🐟 **Fish Shell**: Configured as default shell
- 🎮 **Gaming Setup**: Steam with Proton and Gamescope support
- 🔒 **Tailscale VPN**: Private network connectivity
- 🐳 **Docker**: Rootless Docker setup

## Directory Structure

```
nixos-config/
├── flake.nix            # Main flake configuration
├── nixos/               # NixOS system configurations
│   ├── common/          # Shared system settings
│   ├── laptopUni/       # Laptop-specific settings
│   ├── desktop/         # Desktop-specific settings
│   └── server/          # Server-specific settings
├── home-manager/        # Home Manager configurations
│   ├── common/          # Shared user settings
│   ├── vasilis/         # User "vasilis" configurations
│   └── rizzler/         # User "rizzler" configurations
└── templates/           # Reusable configuration templates
```

## Users

- `vasilis`: Main user for laptop and desktop
- `rizzler`: Server user

## Usage

### Rebuilding a System

```bash
sudo nixos-rebuild switch --flake .#laptopUni
```

### Updating Home Manager Configuration

```bash
home-manager switch --flake .#vasilis@laptopUni
```

### Updating the Flake

```bash
nix flake update
```

## Notable Software

- **Shell**: Fish
- **Editor**: Neovim (customized with nixvim)
- **Desktop**: Supports Hyprland (Wayland)
- **Applications**: Firefox, MPV, Spotify, Vesktop, Localsend
- **Gaming**: Steam, Proton, Gamescope, PrismLauncher, osu-lazer

## Key Features

- Custom NixVim configuration
- Colemak keyboard layout
- Pipewire audio setup
- Docker (rootless)
- Tailscale VPN
- Automatic locale settings

## License

MIT
