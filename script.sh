#!/bin/bash

# Check if a URL is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <deb_file_url>"
  exit 1
fi

# Get the .deb file URL
deb_url="$1"

# Ask for sudo password
echo "Enter your sudo password:"
read -s password

# Download the .deb file
echo "Downloading the .deb file..."
wget -O package.deb "$deb_url"

# Install the .deb file
echo "$password" | sudo -S dpkg -i package.deb

# Check for any installation errors
if [ $? -eq 0 ]; then
  echo "Installation successful!"
else
  echo "Installation failed. Please check for errors."
fi

# Clean up: remove the downloaded .deb file
rm -f package.deb
