#!/bin/bash

# Trivy Installation Script for Ubuntu
# Trivy is a comprehensive security scanner for containers and filesystems

set -e  # Exit on any error

echo "============================================"
echo "Starting Trivy Installation Process"
echo "============================================"

# Update system packages
echo "Updating system packages..."
sudo apt-get update -y

# Install required dependencies
echo "Installing dependencies (wget, gnupg)..."
sudo apt-get install -y wget gnupg

# Download and add Trivy GPG key
echo "Adding Trivy repository GPG key..."
wget -qO - https://aquasecurity.github.io/trivy-repo/deb/public.key | gpg --dearmor | sudo tee /usr/share/keyrings/trivy.gpg > /dev/null

# Add Trivy repository to sources list
echo "Adding Trivy repository..."
echo "deb [signed-by=/usr/share/keyrings/trivy.gpg] https://aquasecurity.github.io/trivy-repo/deb generic main" | sudo tee -a /etc/apt/sources.list.d/trivy.list

# Update package list with Trivy repository
echo "Updating package list..."
sudo apt-get update -y

# Install Trivy
echo "Installing Trivy..."
sudo apt-get install -y trivy

# Verify Trivy installation
echo "Verifying Trivy installation..."
trivy --version

# Update Trivy database
echo "Updating Trivy vulnerability database..."
trivy image --download-db-only

echo "============================================"
echo "Trivy Installation Completed Successfully!"
echo "============================================"
echo "Trivy version: $(trivy --version)"
echo ""
echo "Usage Examples:"
echo "- Scan a container image: trivy image <image-name>"
echo "- Scan a filesystem: trivy fs <directory-path>"
echo "- Scan a repository: trivy repo <repository-url>"
echo "- Scan Kubernetes cluster: trivy k8s <cluster-name>"
echo ""
echo "For more information, visit: https://trivy.dev/"
echo "============================================"