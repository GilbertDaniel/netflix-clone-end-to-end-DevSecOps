#!/bin/bash

# Update existing list of packages
sudo apt update

# Install prerequisite packages
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add Docker's APT repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

# Update package database with Docker packages
sudo apt update

# Install Docker
sudo apt install -y docker-ce

# Add current user to the docker group to run Docker commands without sudo
sudo usermod -aG docker ${USER}

# Print Docker version to verify installation
docker --version

# Enable and start Docker service
sudo systemctl enable --now docker