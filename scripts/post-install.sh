#!/bin/sh

set -ouex pipefail

# pre-enabled services
systemctl enable podman
systemctl enable podman-auto-update

# custom shutdown timeouts
if [ ! -f /etc/systemd/user.conf ]; then
  cp /usr/lib/systemd/user.conf /etc/systemd/
fi
if [ ! -f /etc/systemd/system.conf ]; then
  cp /usr/lib/systemd/system.conf /etc/systemd/
fi
sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/user.conf
sed -i 's/#DefaultTimeoutStopSec.*/DefaultTimeoutStopSec=15s/' /etc/systemd/system.conf
