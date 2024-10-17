#!/bin/sh

# Delete non-current generations
nix-env --delete-generations old

# Cleanup old packages
nix-store --gc
