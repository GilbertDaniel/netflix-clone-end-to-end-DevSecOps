#!/bin/bash

# Jenkins Installation Script for Ubuntu
# This script installs Jenkins with proper error handling and configuration

set -e  # Exit on any error

echo "============================================"
echo "Starting Jenkins Installation Process"
echo "============================================"

# Update system packages
echo "Updating system packages..."
sudo apt update -y

# Install required dependencies
echo "Installing Java and dependencies..."
sudo apt install -y fontconfig openjdk-17-jre-headless curl wget

# Verify Java installation
echo "Verifying Java installation..."
java -version

# Create keyrings directory if it doesn't exist
echo "Setting up Jenkins repository..."
sudo mkdir -p /etc/apt/keyrings

# Download and add Jenkins GPG key
sudo wget -O /etc/apt/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key

# Add Jenkins repository
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update package list with Jenkins repository
echo "Updating package list..."
sudo apt update -y

# Install Jenkins
echo "Installing Jenkins..."
sudo apt install -y jenkins

# Start and enable Jenkins service
echo "Starting Jenkins service..."
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check Jenkins service status
echo "Checking Jenkins service status..."
sudo systemctl status jenkins --no-pager
# Wait for Jenkins to start up
echo "Waiting for Jenkins to initialize..."
sleep 30

sudo apt-get install -y libatomic1
# Display Jenkins initial admin password
echo "============================================"
echo "Jenkins Installation Completed Successfully!"
echo "============================================"
echo "Jenkins is running on: http://$(curl -s ifconfig.me):8080"
echo "Local access: http://localhost:8080"
echo ""
echo "Initial Admin Password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo ""
echo "============================================"
echo "Next Steps:"
echo "1. Open Jenkins web interface"
echo "2. Use the initial admin password above"
echo "3. Install suggested plugins"
echo "4. Create your first admin user"
echo "============================================"