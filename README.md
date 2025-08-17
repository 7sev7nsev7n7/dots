# Dotfiles for Hyprland

simple dotfiles for hyprland setup. i refuse to make an installation script
(for the time being)

dotfiles are intended to unify themes and colors among all graphical components
(where applicable). this includes firefox, discord, the terminal/neovim, etc.,
as well as setting up keybinds to allow easy access to everything through
keyboard, minimizing mouse usage.

just make sure to copy the files to their appropriate directories and you
should be good to go. consider 'root' to be the root mountpoint

<img src="/assets/demo.webp" width=960>
<sub>Demo shown here may be out of date with most recent commits due to laziness</sub>

#### NOTE

some configuration files (specifically `dunst` and `swaylock`) will only work
after an initial loading of said configurations via `wal`

# Dependencies

necessary dependancies for complete setup

- wofi (application launcher)
- nsxiv (image viewer)
- kitty (terminal emulator)
- swaylock (lock screen)
- dunst (notifications daemon)
- pywal16 (wallpaper color palette generator)
- pywal-fox (for firefox browser)
- waybar (top/status bar)
- asusctl (hardware-specific)
- backlight_control (self-explanatory)
- pipewire/pipewire-pulse + wireplumber 
- lsd (ls extension that includes icons and glyphs)
- flameshot (screenshot utility)
- gtk3/4
- Iosevka fonts

you can supply your own wallpapers if you desire
