#!/bin/sh
export NIX_HTTP_USE_HTTP2=0
home-manager switch --flake . --extra-experimental-features "nix-command flakes" --impure -b backup
