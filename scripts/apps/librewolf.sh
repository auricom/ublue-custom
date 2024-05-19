#!/usr/bin/env sh

# Thanks to bri for the inspiration! My script is based on this example:
# https://github.com/briorg/bluefin/blob/c62c30a04d42fd959ea770722c6b51216b4ec45b/scripts/1password.sh

set -ouex pipefail

echo "Installing Librefowlf"

# On libostree systems, /opt is a symlink to /var/opt,
# which actually only exists on the live system. /var is
# a separate mutable, stateful FS that's overlaid onto
# the ostree rootfs. Therefore we need to install it into
# /usr/lib/google instead, and dynamically create a
# symbolic link /opt/google => /usr/lib/google upon
# boot.

# Setup repo
wget --quiet --output-document /etc/yum.repos.d/librewolf.repo \
    https://rpm.librewolf.net/librewolf-repo.repo

# Now let's install the packages.
rpm-ostree install librewolf

# Clean up the yum repo (updates are baked into new images)
rm /etc/yum.repos.d/librewolf.repo -f
