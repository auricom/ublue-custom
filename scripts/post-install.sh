#!/bin/sh

set -ouex pipefail

# temporarily disabled for testing various signature verification methods
# add customized container policy based on upstream's
#cat /usr/etc/containers/policy.json  | jq -M '.transports.docker += {"ghcr.io/bsherman":[{"type":"sigstoreSigned","keyPath":"/usr/etc/pki/containers/bsherman.pub","signedIdentity":{"type":"matchRepository"}}]}' > /tmp/bsherman-policy.json && \
#  cp /tmp/bsherman-policy.json /usr/etc/containers/policy.json

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
