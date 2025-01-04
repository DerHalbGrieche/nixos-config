#! /bin/bash

cd /home/vasilis/Documents/nixos
nix flake update
sudo nixos-rebuild switch --flake .#laptopUni
home-manager switch --flake .#vasilis@laptopUni