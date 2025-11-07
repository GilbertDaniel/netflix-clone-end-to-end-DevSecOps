#!/bin/bash

# kubectl Installation Script
# Installs kubectl v1.31.0 (latest stable version as of Nov 2024)

set -e  # Exit on any error

echo "Installing kubectl..."

# Update to use a valid kubectl version (v1.33.5 doesn't exist)
curl -LO https://dl.k8s.io/release/v1.31.0/bin/linux/amd64/kubectl
curl -LO https://dl.k8s.io/release/v1.31.0/bin/linux/amd64/kubectl.sha256
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Verify installation
kubectl version --client

# Clean up
rm -f kubectl kubectl.sha256

echo "kubectl installation completed successfully!"