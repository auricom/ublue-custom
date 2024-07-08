#!/usr/bin/bash

set -ouex pipefail


# renovate: datasource=github-releases depName=comictagger/comictagger
COMICTAGGER_VERSION=1.6.0-alpha.12

wget --quiet --output-document /usr/bin/comictagger \
    "https://github.com/comictagger/comictagger/releases/download/${COMICTAGGER_VERSION}/ComicTagger-x86_64.AppImage"

chmod +x /usr/bin/comictagger
