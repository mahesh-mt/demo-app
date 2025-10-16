#!/bin/bash
set -e  # Exit immediately if any command fails

echo "Stopping nginx service..."
sudo systemctl stop nginx || echo "Nginx not running or not installed, continuing..."

echo "Backing up existing config file..."
if [ -f /var/www/html/index.yml ]; then
  cp /var/www/html/index.yml /var/backups/index.yml.bak.$(date +%F-%T)
  echo "Backup created at /var/backups/"
else
  echo "No config file to backup."
fi

echo "Cleaning up old application files..."
rm -rf /var/www/html/*

echo "Creating uploads directory and setting permissions..."
mkdir -p /var/www/html/uploads
chown root:root /var/www/html/uploads

echo "BeforeInstall script completed successfully."
