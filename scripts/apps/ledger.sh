#!/usr/bin/bash

set -ouex pipefail

# Ledger Live Desktop
wget --quiet --output-document /usr/bin/ledgerlive \
    https://download.live.ledger.com/latest/linux

chmod +x /usr/bin/ledgerlive

# udev rules
wget --quiet --output-document /etc/udev/rules.d/20-hw1.rules \
    https://raw.githubusercontent.com/LedgerHQ/udev-rules/master/20-hw1.rules