#!/usr/bin/env bash
#
# Sets an alias for Bitwarden CLI if the 'bw' binary is not found in PATH and
# Bitwarden Flatpak is installed. This allows using 'bw' via Flatpak as a
# fallback when no native binary is available.

if ! command -v bw >/dev/null 2>&1 &&
   flatpak list --app | grep -q "com.bitwarden.desktop"; then
  alias bw='flatpak run --command=bw com.bitwarden.desktop'
fi
