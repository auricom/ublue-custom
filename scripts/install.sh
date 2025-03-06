#!/bin/sh

set -ouex pipefail

# ensure that RPM post-install don't break with alternatives reqs
mkdir -p /var/lib/alternatives

# apps install
/tmp/apps/1password.sh
/tmp/apps/comictagger.sh
/tmp/apps/devbox.sh
/tmp/apps/dysk.sh
/tmp/apps/k8slens.sh
/tmp/apps/kopiaui.sh
/tmp/apps/ledger.sh
/tmp/apps/streamdeck.sh
