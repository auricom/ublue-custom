#!/usr/bin/bash

set -ouex pipefail


wget --quiet --output-document /usr/bin/ledgerlive \
    https://download.live.ledger.com/latest/linux

chmod +x /usr/bin/ledgerlive