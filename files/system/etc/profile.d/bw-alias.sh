#!/usr/bin/env bash
# Check if Bitwarden Flatpak is installed
if flatpak list --app | grep -q "com.bitwarden.desktop"; then
    : # TODO: Uncomment the alias if Bitwarden CLI via Flatpak is needed
    # alias bw='flatpak run --command=bw com.bitwarden.desktop'
fi
