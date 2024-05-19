#!/bin/sh

set -ouex pipefail

# ensure that RPM post-install don't break with alternatives reqs
mkdir -p /var/lib/alternatives

/tmp/fonts.sh
/tmp/grub-theme.sh

# apps install
flatpak install https://downloads.1password.com/linux/flatpak/1Password.flatpakref
/tmp/apps/comictagger.sh
/tmp/apps/devbox.sh
/tmp/apps/dysk.sh
/tmp/apps/ledgerlive.sh
/tmp/apps/nix-portable.sh
