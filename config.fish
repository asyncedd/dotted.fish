#!/usr/bin/env fish

fish_config theme choose "Catppuccin Mocha" # Set the theme to some Catppuccin ☕

# Check if starship is installed
if not type -q starship
  # Starship is not installed, so download and install it
  echo "Starship is not installed. Installing..."
  curl -sS https://starship.rs/install.sh | sh
  # Note: The --yes option automatically installs starship without prompting for confirmation
end

# Only run this in interactive shells
if status is-interactive

  # fish_vi_key_bindings
  # Set the cursor shapes for the different vi modes.
  set fish_cursor_default block blink
  set fish_cursor_insert line blink
  set fish_cursor_replace_one underscore blink
  set fish_cursor_visual block

  function fish_user_key_bindings
    # Execute this once per mode that emacs bindings should be used in
    fish_default_key_bindings -M insert
    fish_vi_key_bindings --no-erase insert
  end

  # Force the cursor to be set above
  set -g fish_vi_force_cursor 1

  # Set the editor to be Neovim, duh
  set -gx EDITOR nvim
  # Use Wezterm :D
  set -gx TERM wezterm

  if type -q vivid
    if test "$APPEARANCE" = light
      set -gx LS_COLORS (vivid generate catppuccin-latte)
    else
      set -gx LS_COLORS (vivid generate catppuccin-mocha)
    end
  end
end

starship init fish | source
