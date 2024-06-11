#!/bin/bash

# Variables
USER_NAME=$(hostnamectl hostname)
NIX_CONF="/etc/nix/nix.conf"

# Enable Flakes
echo "Enabling flakes..."
sudo mkdir -p /etc/nix/
echo "experimental-features = nix-command flakes" | sudo tee -a $NIX_CONF

# Install Home Manager
echo "Setting up Home Manager directory..."

# Initialize Flake if it does not exist
# Build and apply the flake configuration
echo "Building and applying Home Manager configuration..."
nix run .#homeConfigurations.$USER_NAME.activationPackage

# Alternatively, switch to the configuration
echo "Switching to the new configuration..."
home-manager switch --flake .

echo "Setup complete!"

