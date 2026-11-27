#!/usr/bin/env bash
# Install the Rosé Pine config for the SilentSDDM login screen.
# Usage: ./install.sh [wallpaper]   (asks for sudo)
# Re-run after an update of sddm-silent-theme, which resets the theme's metadata.desktop.
set -euo pipefail

here="$(cd "$(dirname "$0")" && pwd)"
theme=/usr/share/sddm/themes/silent
wallpaper="${1:-$HOME/dotfiles/backgrounds/.config/backgrounds/john-towner.jpg}"

if [ ! -d "$theme" ]; then
    echo "SilentSDDM not found in $theme. Install it first: yay -S sddm-silent-theme" >&2
    exit 1
fi
if [ ! -f "$wallpaper" ]; then
    echo "Wallpaper not found: $wallpaper" >&2
    exit 1
fi

sudo install -Dm644 "$here/rose-pine.conf" "$theme/configs/rose-pine.conf"
sudo install -Dm644 "$wallpaper" "$theme/backgrounds/rose-pine-wallpaper.jpg"
sudo sed -i 's|^ConfigFile=.*|ConfigFile=configs/rose-pine.conf|' "$theme/metadata.desktop"
sudo install -Dm644 "$here/sddm.conf.d/99-silent.conf" /etc/sddm.conf.d/99-silent.conf

if grep -qs '^Current=' /etc/sddm.conf && ! grep -qs '^Current=silent' /etc/sddm.conf; then
    echo "Warning: /etc/sddm.conf sets a different theme and overrides /etc/sddm.conf.d/." >&2
    echo "Remove or change its Current= line." >&2
fi

echo "Done. Preview without logging out: cd $theme && ./test.sh"
