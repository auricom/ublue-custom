#!/usr/bin/bash

set -ouex pipefail


wget --quiet --output-document /usr/bin/nix-portable \
    "https://github.com/DavHau/nix-portable/releases/latest/download/nix-portable-$(uname -m)" && \

chmod +x /usr/bin/nix-portable

ln -s /usr/bin/nix-portable /usr/bin/nix
ln -s /usr/bin/nix-portable /usr/bin/nix-shell

#####
# Register path symlink
# We do this via tmpfiles.d so that it is created by the live system.
cat >/usr/lib/tmpfiles.d/nix-portable.conf <<EOF
d /var/home/nix-portable 0755 1000 1000 - -
d /var/home/nix-portable/store 0755 1000 1000 - -
EOF