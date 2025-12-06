#!/usr/bin/env bash

# Tell this script to exit if there are any errors.
# You should have this in every custom script, to ensure that your completed
# builds actually ran successfully without any errors!
set -oue pipefail

# Your code goes here.
echo 'Add onepassword remote repository to flatpak configuration'

# Download the GPG keys using curl
curl -sL "https://downloads.1password.com/linux/flatpak/repo/onepassword.asc" | \
  gpg --dearmor -o "/usr/share/keyrings/1password-archive-keyring.gpg"

# Add the Flatpak remote repository
flatpak remote-add \
    --if-not-exists \
    --no-enumerate \
    --gpg-verify-key="/usr/share/keyrings/1password-archive-keyring.gpg" \
    "onepassword-origin" \
    "https://downloads.1password.com/linux/flatpak/repo/"
