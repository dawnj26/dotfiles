install_dependencies() {
  yay -Sy \
    ninja \
    gcc \
    clang \
    cmake \
    meson \
    libxcb \
    xcb-proto \
    xcb-util \
    xcb-util-keysyms \
    libxfixes \
    libx11 \
    libxcomposite \
    libxrender \
    libxcursor \
    pixman \
    wayland-protocols \
    cairo \
    pango \
    libxkbcommon \
    xcb-util-wm \
    xorg-xwayland \
    libinput \
    libliftoff \
    libdisplay-info \
    cpio \
    tomlplusplus \
    xcb-util-errors \
    glaze \
    re2 \
    hyprutils-git \
    aquamarine-git \
    hyprgraphics-git \
    hyprlang-git \
    hyprcursor-git \
    hyprwayland-scanner-git \
    hyprland-qtutils-git \
    hypridle-git \
    hyprpicker-git \
    hyprpaper-git \
    hyprlock-git \
    hyprland-protocols-git \
    xdg-desktop-portal-hyprland-git \
    hyprsysteminfo-git
}

remove_installed_packages() {
  local package_list=("$@")

  for pkg in "${package_list[@]}"; do
    yay -Rdd --noconfirm "$pkg" 2>/dev/null || echo "Package $pkg not installed"
  done
}

remove_conflicts() {
  local git_packages=(
    hypridle-git hyprland-git hyprlock-git hyprpaper-git hyprpicker-git
    hyprpolkitagent-git hyprsunset-git hyprsysteminfo-git xdg-desktop-portal-hyprland-git
    aquamarine-git hyprgraphics-git hyprland-qtutils-git hyprlang-git hyprutils-git
    hyprland-protocols-git hyprwayland-scanner-git hyprland-meta-git hyprland-qt-support-git
    hyprcursor-git
  )

  local stable_packages=(
    hyprland hyprcursor hyprlang hyprwayland-scanner hyprpaper hyprutils aquamarine
    hypridle hyprland-qtutils hyprpicker xdg-desktop-portal-hyprland hyprgraphics
    hyprland-qt-support
  )

  remove_installed_packages "${git_packages[@]}" "${stable_packages[@]}"
}

# Function to clone, build, and install Hyprland
install_hyprland() {
  local temp_dir
  temp_dir=$(mktemp -d) # Create a temporary directory
  cd "$temp_dir"
  echo "Working in temporary directory: $temp_dir"

  echo "Cloning the Hyprland repository (this may take a moment)..."
  if ! git clone --recursive https://github.com/hyprwm/Hyprland.git; then
    echo "Failed to clone the Hyprland repository."
  fi
  cd Hyprland

  echo "Configuring the build with CMake..."
  if ! cmake --no-warn-unused-cli -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++ -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build; then
    echo "CMake configuration failed. Please check the output for errors."
  fi

  echo "Compiling with make (using all available cores)..."
  if ! cmake --build ./build --config Release --target all -j$(nproc); then
    echo "Build failed. Please check the output for errors."
  fi

  echo "Installing Hyprland system-wide..."
  if ! sudo cmake --install ./build; then
    echo "Installation failed. Please check the output for errors. Temp dir: $temp_dir"
  else
    # Cleanup the temporary directory
    rm -rf "$temp_dir"
    echo "Cleaned up temporary directory."
  fi

}

main() {
  remove_conflicts
  install_dependencies
  install_hyprland
  echo "Hyprland installation completed successfully."
}

install_hyprland
