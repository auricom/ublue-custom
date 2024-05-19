#!/usr/bin/bash

set -ouex pipefail


mkdir /usr/nix
mkdir -p /home/nix/store

ln -s /home/nix/store /usr/nix/store

chown -R 1000:1000 /home/nix