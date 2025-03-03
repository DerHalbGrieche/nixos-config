#! /bin/bash

cd /home/vasilis/nixos-config-mirror
nix flake update
git add flake.lock
sudo nixos-rebuild switch --flake .#desktop
home-manager switch --flake .#vasilis@desktop
