#!/bin/sh
sudo nixos-rebuild switch --flake . --impure -j4
