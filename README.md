# dotfiles

Arch + Hyprland setup, managed with [GNU Stow](https://www.gnu.org/software/stow/).
Every top-level folder is one stow package that mirrors `$HOME`.

## Install

Clone into your home folder and stow everything:

    git clone https://github.com/mhjdemmers/dotfiles ~/dotfiles
    cd ~/dotfiles
    stow */

Stow refuses to overwrite existing files. If Hyprland already generated a default
`~/.config/hypr/hyprland.lua` on first launch, delete it before stowing.

oh-my-zsh is not vendored here; install it from https://ohmyz.sh first, then delete the
`~/.zshrc` its installer writes and re-run `stow zsh`.

Put machine-specific shell stuff in `~/.zshrc.local` (not tracked).

## Packages

Hyprland stack: `hyprland hyprlock hypridle hyprpaper hyprshot waybar rofi waypaper`
`brightnessctl playerctl wireplumber` and `rose-pine-hyprcursor` (AUR).

Terminal and tools: `ghostty zsh tmux zellij neovim yazi lazygit fzf fd ripgrep eza zoxide`
`keychain fastfetch helix mise`.

Fonts: `ttf-jetbrains-mono-nerd`.

## Notes

- `hyprland.lua` uses the Lua config format (Hyprland 0.55+). Colors live in
  `rose-pine.lua`; switch the `require` to `rose-pine-dawn` for the light theme.
- `rose-pine.conf` / `rose-pine-dawn.conf` are still needed: hyprlock reads them.
- The lock screen and rofi use `~/.config/rofi/.current_wallpaper`, which waypaper
  writes when you pick a wallpaper. Pick one once after installing.
- `hypridle.conf` targets the ThinkPad keyboard backlight (`tpacpi::kbd_backlight`).
  Check the name on other laptops with `brightnessctl -l`.
