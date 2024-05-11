#!/usr/bin/bash

set -ouex pipefail

FONTS_DIR="/usr/share/fonts"


# nerd font CascadiaCode
mkdir "${FONTS_DIR}/caskaydiacove"

wget --quiet --output-document "${FONTS_DIR}/caskaydiacove/CaskaydiaCoveNerdFont-Italic.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/CaskaydiaCoveNerdFont-Italic.ttf

wget --quiet --output-document "${FONTS_DIR}/caskaydiacove/CaskaydiaCoveNerdFont-Regular.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Regular/CaskaydiaCoveNerdFont-Regular.ttf


# nerd font IBM Plex Mono
mkdir "${FONTS_DIR}/blexmono"

wget --quiet --output-document "${FONTS_DIR}/blexmono/BlexMonoNerdFontMono-Medium.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/IBMPlexMono/Mono/BlexMonoNerdFontMono-Medium.ttf

wget --quiet --output-document "${FONTS_DIR}/blexmono/BlexMonoNerdFontMono-Regular.ttf" \
    https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/IBMPlexMono/Mono/BlexMonoNerdFontMono-Regular.ttf

fc-cache -f "${FONTS_DIR}/caskaydiacove"
fc-cache -f "${FONTS_DIR}/blexmono"
