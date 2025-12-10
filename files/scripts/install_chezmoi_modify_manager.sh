#!/usr/bin/env bash
# Use strict mode to catch errors and prevent undefined variable usage
set -euo pipefail

# Create temporary directory for download and extraction
dir=$(mktemp -d)

# Fetch latest release version from GitHub API
ver=$(curl -s https://api.github.com/repos/VorpalBlade/chezmoi_modify_manager/releases/latest \
    | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

# Retrieve download URL for the Linux x86_64 binary
url=$(curl -s "https://api.github.com/repos/VorpalBlade/chezmoi_modify_manager/releases/tags/${ver}" \
    | grep -E '"browser_download_url":.*x86_64-unknown-linux-gnu.*tar.gz' | cut -d '"' -f 4)

# Download the binary archive to the temporary directory
curl --location --output $dir/chezmoi_modify_manager.tar.gz "$url"

# Extract the downloaded archive
tar -xzf $dir/chezmoi_modify_manager.tar.gz -C $dir

# Move the binary to the system-wide binaries directory
mv $dir/chezmoi_modify_manager /usr/local/bin/

# Make the binary executable
chmod +x /usr/local/bin/chezmoi_modify_manager

# Clean up: remove the temporary directory
rm -rf $dir
