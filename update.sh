#!/bin/sh
git pull
./rebuild-nixos.sh
./rebuild-home.sh
