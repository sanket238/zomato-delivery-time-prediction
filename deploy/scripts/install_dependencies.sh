#!/bin/bash
set -xe

# CloudWatch log file
LOG_FILE="/var/log/codedeploy-beforeinstall.log"
exec > >(tee -a $LOG_FILE) 2>&1

echo "===== Starting BeforeInstall hook ====="

# Non-interactive mode
export DEBIAN_FRONTEND=noninteractive

echo "Updating package lists..."
apt-get update -y

echo "Installing Docker and utilities..."
apt-get install -y docker.io unzip curl

echo "Starting and enabling Docker..."
systemctl start docker
systemctl enable docker

echo "Downloading and installing AWS CLI..."
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip -o /tmp/awscliv2.zip -d /tmp/
/tmp/aws/install

echo "Adding ubuntu user to docker group..."
usermod -aG docker ubuntu

echo "Cleaning up installation files..."
rm -rf /tmp/aws /tmp/awscliv2.zip

echo "===== BeforeInstall hook completed successfully ====="

# Optional: push log to CloudWatch immediately
if [ -f /etc/awslogs/awslogs.conf ]; then
    service awslogs restart
fi
