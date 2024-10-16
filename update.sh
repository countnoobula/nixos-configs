#!/bin/sh

# Check if a parameter is provided
if [ -n "$1" ]; then
  echo "Switching to branch $1"
  git checkout "$1"
fi

# Pull the latest changes
git pull

# Execute the rebuild scripts
./rebuild-nixos.sh
./rebuild-home.sh
