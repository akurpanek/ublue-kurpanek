#!/usr/bin/env bash

# Prüfen, ob das Bitwarden Flatpak installiert ist
if flatpak list --app | grep -q "com.bitwarden.desktop"; then
    alias bw='flatpak run --command=bw com.bitwarden.desktop'
fi
