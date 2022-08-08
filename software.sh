#!/usr/bin/env bash
#-------------------------------------------------------------------------
#  Arch Linux Post Install Setup and Config
#-------------------------------------------------------------------------

echo
echo "INSTALLING SOFTWARE"
echo

PKGS=(
        'bluez'                 # Daemons for the bluetooth protocol stack
        'bluez-utils'           # Bluetooth development and debugging utilities
        'bluez-firmware'        # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips
        'pipewire-pulse'        # Bluetooth support for PipeWire
        'cronie'                # Cron job
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

sudo systemctl enable cronie.service
sudo systemctl start cronie.service
