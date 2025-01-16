#!/bin/bash

# Function to install packages

# Prompt user for package choice
echo "Select the version of Hyprland to install:"
echo "1) Stable release with associated utilities"
echo "2) Development version (hyprland-meta-git)"
read -rp "Enter your choice (1 or 2): " choice

# Install the selected version
case $choice in
1)
  echo "Installing the stable release of Hyprland and associated utilities..."
  yay -S --noconfirm hyprland hyprcursor hyprlang hyprwayland-scanner hyprpaper hyprpicker xdg-desktop-portal-hyprland
  ;;
2)
  echo "Installing the development version of Hyprland (hyprland-meta-git)..."
  yay -S --noconfirm --answerclean All --answerdiff None hyprland-meta-git
  ;;
*)
  echo "Invalid choice. Exiting."
  exit 1
  ;;
esac

echo "Hyprland installation complete."
