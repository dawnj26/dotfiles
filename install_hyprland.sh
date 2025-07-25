#!/bin/bash

# Error handling function
handle_error() {
  echo "Error: $1"
  exit 1
}

# Function to install yay if not present
install_yay() {
  echo "yay not found. Installing yay..."

  # Check if git is installed
  if ! command -v git >/dev/null 2>&1; then
    echo "Installing git..."
    sudo pacman -S --noconfirm git || handle_error "Failed to install git"
  fi

  # Check if base-devel is installed
  if ! pacman -Qi base-devel >/dev/null 2>&1; then
    echo "Installing base-devel..."
    sudo pacman -S --noconfirm base-devel || handle_error "Failed to install base-devel"
  fi

  # Create temporary directory
  temp_dir=$(mktemp -d)
  cd "$temp_dir" || handle_error "Failed to create temporary directory"

  # Clone and build yay
  git clone https://aur.archlinux.org/yay.git || handle_error "Failed to clone yay repository"
  cd yay || handle_error "Failed to enter yay directory"
  makepkg -si --noconfirm || handle_error "Failed to build and install yay"

  # Clean up
  cd / || handle_error "Failed to leave temporary directory"
  rm -rf "$temp_dir"

  echo "yay has been successfully installed!"
}

# Check if yay is installed, install if not
if ! command -v yay >/dev/null 2>&1; then
  install_yay
fi

# Function to remove git versions of Hyprland ecosystem
remove_git_versions() {
  local git_packages="hypridle-git hyprland-git hyprlock-git hyprpaper-git hyprpicker-git hyprpolkitagent-git hyprsunset-git hyprsysteminfo-git xdg-desktop-portal-hyprland-git aquamarine-git hyprgraphics-git hyprland-qtutils-git hyprlang-git hyprutils-git hyprland-protocols-git hyprwayland-scanner-git hyprland-meta-git hyprland-qt-support-git hyprcursor-git"

  # Check if any git packages are installed
  local installed_packages=""
  for pkg in $git_packages; do
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
      installed_packages="$installed_packages $pkg"
    fi
  done

  # Remove installed packages if any found
  if [ -n "$installed_packages" ]; then
    echo "Removing git versions of Hyprland ecosystem..."
    yay -R --noconfirm $installed_packages || handle_error "Failed to remove git packages"
  fi
}

# Function to remove stable versions of Hyprland ecosystem
remove_stable_versions() {
  local stable_packages="hyprland hyprcursor hyprlang hyprwayland-scanner hyprpaper hyprutils aquamarine hypridle hyprland-qtutils hyprpicker xdg-desktop-portal-hyprland hyprgraphics hyprland-qt-support"

  # Check if any stable packages are installed
  local installed_packages=""
  for pkg in $stable_packages; do
    if pacman -Qi "$pkg" >/dev/null 2>&1; then
      installed_packages="$installed_packages $pkg"
    fi
  done

  # Remove installed packages if any found
  if [ -n "$installed_packages" ]; then
    echo "Removing stable versions of Hyprland ecosystem..."
    yay -R --noconfirm $installed_packages || handle_error "Failed to remove stable packages"
  fi
}

echo "Select the version of Hyprland to install:"
echo "1) Stable release"
echo "2) Development version (hyprland-meta-git)"
read -rp "Enter your choice (1 or 2): " choice

case $choice in
1)
  echo "Checking for and removing any git versions of Hyprland ecosystem..."
  remove_git_versions

  echo "Installing the stable release of Hyprland and associated utilities..."
  yay -S --needed --noconfirm \
    hyprland \
    hyprcursor \
    hyprlang \
    hyprwayland-scanner \
    hyprpaper \
    hyprutils \
    aquamarine \
    hypridle \
    hyprland-qtutils \
    hyprpicker \
    xdg-desktop-portal-hyprland || handle_error "Failed to install stable packages"
  ;;
2)
  echo "Checking for and removing any stable versions of Hyprland ecosystem..."
  remove_stable_versions

  echo "Installing the development version of Hyprland (hyprland-meta-git)..."
  yay -S --needed --noconfirm --answerclean All --answerdiff None \
    hyprland-meta-git || handle_error "Failed to install hyprland-meta-git"
  ;;
*)
  handle_error "Invalid choice. Please enter 1 or 2."
  ;;
esac

echo "Hyprland installation completed successfully!"
