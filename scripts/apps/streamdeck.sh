#!/usr/bin/bash

set -ouex pipefail

# udev rules
wget --quiet --output-document /etc/udev/rules.d/60-streamdeck.rules \
    https://raw.githubusercontent.com/streamdeck-linux-gui/streamdeck-linux-gui/main/udev/60-streamdeck.rules