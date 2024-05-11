#!/usr/bin/bash

set -ouex pipefail


wget --quiet --output-document /usr/bin/dysk \
    https://dystroy.org/dysk/download/x86_64-linux/dysk

chmod +x /usr/bin/dysk
