# 🛠️ Arch-Hyprland "Cyber-Zen" Rice

A fully customized, high-performance "Extreme Hacker" rice for Arch Linux and Hyprland. This setup balances aggressive cyberpunk aesthetics with extreme focus utilities.

![Preview](https://raw.githubusercontent.com/your-username/ARCH-RICE/main/preview.png) *(Note: Add your own preview screenshot here!)*

## ✨ Key Features
- **Super Ghost Terminal (`SUPER + T`)**: Fullscreen, 100% transparent, borderless, and shadowless. Just your text floating on the wallpaper.
- **Cyber-HUD Dashboard (`Alt`)**: A glassy, animated system overlay showing CPU, RAM, Disk, and Battery with glitch animations.
- **Hacker Clock & Net HUD (`SUPER + B`)**: Massive ASCII digital clock and real-time network traffic monitor (`bmon`) at the top of your screen.
- **Encryption Switch (`SUPER + 1-5`)**: Instant workspace switching without delays, with automatic wallpaper and theme syncing.
- **Extreme Hacker Lockscreen (`SUPER + L`)**: Translucent live-blur UI with kernel log overlays and a root terminal prompt.
- **Deep-Zen Focus (`SUPER + Z`)**: One-touch isolation—mutes audio, kills Waybar, maximizes gaps, and sets a black wallpaper.
- **Panic Protocol (`SUPER + P`)**: Stealth mode—hides all windows and dims brightness to 20% instantly.
- **Resource-Reactive Borders**: Active window borders turn **Red/Orange** automatically if your CPU is stressed or hot.
- **Dynamic Waybar**: Multi-pill capsule design with functional buttons for Wi-Fi, Bluetooth, and Notifications.

## 🚀 One-Command Installation

To install the exact setup, run this in your terminal:

```bash
git clone https://github.com/your-username/ARCH-RICE && cd ARCH-RICE && chmod +x install.sh && ./install.sh
```

## ⌨️ Critical Shortcuts
| Keybind | Action |
| :--- | :--- |
| `SUPER + Q` | Open Default Terminal (Ghostly) |
| `SUPER + SHIFT + B` | Open Firefox Browser |
| `SUPER + B` | Toggle Clock & Network HUDs |
| `SUPER + T` | Launch Fullscreen Ghost Shell (Pure Text) |
| `Alt` | Toggle Cyber-HUD Dashboard |
| `SUPER + V` | Cycle Window (Compact -> Full -> Tiled) |
| `SUPER + L` | Lock Screen (Cyber-Hacker UI) |
| `SUPER + Z` | Toggle Deep-Zen Focus Mode |
| `SUPER + P` | Trigger Panic Protocol (Stealth) |
| `SUPER + H` | Show Interactive Help Menu |
| `Print` | Capture Timstamped Area Screenshot |
| `SUPER + O` | Toggle Active Window Opacity |
| `SUPER + F` | Toggle Global System Blur |

## 🛠️ Components
- **Compositor:** Hyprland
- **Bar:** Waybar
- **Terminal:** Kitty
- **Shell:** Zsh + Starship Prompt
- **Launcher:** Rofi
- **Notifications:** Mako
- **Wallpaper:** Awww + Pywal for dynamic theming
- **Widgets:** Eww (ElKowar's Wacky Widgets)

## ⚠️ Notes
- The installer assumes you are on **Arch Linux**.
- It will automatically install **`yay`** if you don't have an AUR helper.
- Existing configurations for Hyprland, Waybar, Kitty, and Zsh will be backed up to `~/dotfiles_backup_TIMESTAMP`.

---
*Developed with 💚 by Suryansh*
