# ublue-custom

[![build-ublue](https://github.com/bsherman/ublue-custom/actions/workflows/build.yml/badge.svg)](https://github.com/bsherman/ublue-custom/actions/workflows/build.yml)

Custom Fedora immutable desktop images which are mostly stock, plus the few things that are needed to make life good on my family's laptops.

## What is this?

These images are customized how I want, based on the great work by [team ublue os](https://github.com/ublue-os).

Images built:

- Bluefin-dx
- Bluefin-dx-nvidia

Based on:

- [ublue-os/main](https://github.com/ublue-os/main) for good foundations
  - adds distrobox, freeworld mesa and media codecs, gnome-tweaks (on gnome), just, nvtop, openssl, pipewire-codec-aptx, ratbagd, vim
  - sets automatic staging of updates to system
  - sets flatpaks to update twice a day
- [ublue-os/nvida](https://github.com/ublue-os/nvidia) for nvidia variants adds:
  - nvidia kernel drivers
  - nvidia container runtime
  - nvidia vaapi driver
  - nvidia selinux config

## Features

In addition to the packages/config provided by base images, this image:
  
- Adds the following packages to the base image:
  - Only on Silverblue: Gnome specific packages
    - default font set to Noto Sans
    - gnome shell extensions (appindicator, dash-to-dock, gsconnect, move-clock, no-overview, notifications-reloaded)
    - gsconnect (plus dependancies)
- Sets faster timeout on systemd waiting for shutdown
- Sets gnome's "APP is not responding" check to 30 seconds
- Sets some a few custom gnome settings (see etc/dconf)

## Applications

- Flatpaks
  - Then run `just install-apps-gnome` to install the now missing apps (plus a few nice extras)
  - Run `just` recipe with `-n` for a dry-run, eg: `just -n install-apps-creative`

## Just Customizations

A `just` task runner default config is included for easy customization after first boot.
It will copy a template to your home directory.

After that run `ujust` to get a list of default commands ( a sample set of commands is included below ):

```bash
`ujust
Click here to view the Universal Blue just documentation
Available commands:
 - install-apps                   # Install misc apps for my home users
 - install-games                  # Install Steam with MangoHud, Gamescope and Prototricks
 - install-pwa-flatpak-overrides  # Give browsers permission to create PWAs (Progressive Web Apps)
```

Check the [just website](https://just.systems) for tips on modifying and adding your own recipes.

## Installation & Usage

### Install from Upstream

Install from an official Bluefin ISO:

- [Silverblue (GNOME)](https://fedoraproject.org/silverblue/download/)

### Rebase to Custom

After installation is complete, use the appropriate `rebase` command to install one of these custom images.

_Note: for `IMAGE_NAME` in the commands below, substitute one of these image names:_

- `bluefin-dx`
- `bluefin-dx-nvidia`

We build `latest` which currently points to Fedora 39 (Fedora 40 will become latest after it releases and related packages have stabilized). Fedora 37 and 38 are no longer built here. You can chose a specific version by using the `39` or `40` tag instead of `latest`:

    sudo rpm-ostree rebase \
        ostree-unverified-registry:ghcr.io/auricom/IMAGE_NAME:latest

We build date tags as well, so if you want to rebase to a particular day's release:

    sudo rpm-ostree rebase \
        ostree-unverified-registry:ghcr.io/auricom/IMAGE_NAME:39-20240419

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/) using both OpenID Connect with Github and a repo specific keypair. You can verify the signature by running one the following command:

    cosign verify \
        --certificate-oidc-issuer "https://token.actions.githubusercontent.com" \
        --certificate-identity-regexp "https://github.com/auricom/ublue-custom" \
        ghcr.io/auricom/IMAGE_NAME

    cosign verify --key cosign.pub ghcr.io/auricom/IMAGE_NAME
