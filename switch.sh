#!/usr/bin/env bash
set -e
cd ~/nixconfig
WHERE=$(cat /etc/hostname)
alejandra .
git add .
sudo nixos-rebuild switch --show-trace --builders "" --flake .#$WHERE
git commit --allow-empty -m "$(whoami)@${WHERE} : $(date) - $@"
nix-env --delete-generations 7d
nix-store --gc
