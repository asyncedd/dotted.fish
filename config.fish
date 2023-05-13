#!/usr/bin/env fish

fish_config theme choose "Catppuccin Mocha" # Set the theme to some Catppuccin ☕

# Check if starship is installed
if not type -q starship
  # Starship is not installed, so download and install it
  echo "Starship is not installed. Installing..."
  curl -sS https://starship.rs/install.sh | sh
  # Note: The --yes option automatically installs starship without prompting for confirmation
end

fish_vi_key_bindings

starship init fish | source
