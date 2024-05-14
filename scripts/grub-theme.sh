#!/usr/bin/bash

set -ouex pipefail

version=$(curl -s https://api.github.com/repos/Coopydood/HyperFluent-GRUB-Theme/releases | jq -r '.[].tag_name' | sort -V | tail -n 1)

mkdir -p /boot/grub2/themes/hyperfluent

wget --quiet --output-document /tmp/grub.tar.gz \
    https://github.com/Coopydood/HyperFluent-GRUB-Theme/releases/download/${version}/hyperfluent-fedora.tar.gz

unzip /tmp/grub.tar.gz -d /boot/grub2/themes/hyperfluent/
