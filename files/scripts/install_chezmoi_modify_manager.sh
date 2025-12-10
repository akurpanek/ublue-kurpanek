#!/bin/bash
set -euxo pipefail

# Fetch the latest release tag from GitHub API
RELEASE=$(curl -s https://api.github.com/repos/VorpalBlade/chezmoi_modify_manager/releases/latest \
  | grep '"tag_name":' \
  | sed -E 's/.*"([^"]+)".*/\1/')

# Download the binary using curl
curl \
  -L "https://github.com/VorpalBlade/chezmoi_modify_manager/releases/download/${RELEASE}/chezmoi_modify_manager-linux-amd64" \
  -o /usr/local/bin/chezmoi_modify_manager

# Make the binary executable
chmod +x /usr/local/bin/chezmoi_modify_manager
