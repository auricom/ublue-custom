#!/usr/bin/bash

set -ouex pipefail


version=$(curl -s https://api.github.com/repos/comictagger/comictagger/releases | jq -r '.[].tag_name' | sort -V | tail -n 1)

wget --quiet --output-document /usr/bin/comictagger \
    https://github.com/comictagger/comictagger/releases/download/${version}/ComicTagger-x86_64.AppImage

chmod +x /usr/bin/comictagger
