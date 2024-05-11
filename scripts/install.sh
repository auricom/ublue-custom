#!/bin/sh

set -ouex pipefail

# ensure that RPM post-install don't break with alternatives reqs
mkdir -p /var/lib/alternatives

# fonts install
/tmp/fonts.sh

# apps install
/tmp/apps/1password.sh
/tmp/apps/brave.sh
/tmp/apps/comictagger.sh
/tmp/apps/dysk.sh
/tmp/apps/ledgerlive.sh
