<table>
  <tr>
    <td><img width="600" height="300" alt="screenshot-1" src="https://github.com/user-attachments/assets/5367ef90-3ac5-44bc-83fd-a3062201de31" />
</td>
    <td><img width="600" height="300" alt="screenshot-2" src="https://github.com/user-attachments/assets/c2f6c664-6bc4-4492-9e8a-5fca8b609921" />
</td>
  </tr>
</table>


# Macos Alike Shell, Rice made with Quickshell for Linux Hyprland
This is the shell i've been working on for the past week, built with Quickshell an widget toolkit powered by QML QT's language, the purprose of the Shell is to look close to macOS as best as
possible while working within the limitations of Hyprland and Quickshell

## ⚠️ Development Notice
Currently the shell is under development and is currently reaching beta phase. it is not yet finished and is not Production-Ready right now is not recommended for daily use while it aims to replicate macOS style it is not 1:1

## 🚀 Features
- Working menu bar
- Dock (Limited applicaitons can only be added in a config file not all apps work well with this more information in the [wiki](https://github.com/1nhp/dotfiles/wiki))
- Launchpad-style application launcher
- macOS-inspired UI
- Lightweight (in most cases)

### Distrobution Support
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Support</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Archlinux</td>
      <td>🟢 Full</td>
    </tr>
    <tr>
      <td>Artix</td>
      <td>🟡 - Partial - will require the installation script to replace daemons with binary files autostarting</td>
    </tr>
    <tr>
      <td>Gentoo</td>
      <td>🔴 - Unsupported (but you can try get it working)</td>
    </tr>
    <tr>
      <td>Debian</td>
      <td>🔴 - Unsupported (but you can try get it working)</td>
    </tr>
    <tr>
      <td>Linux Mint</td>
      <td>🔴 - Unsupported (but you can try get it working)</td>
    </tr>
    <tr>
</table>

### Specs
- WM: Hyprland
- FM: Thunar
- Terminal: Alacritty
- Shell: Quickshell
- Distro: Archlinux
- Wallpaper: None(stock)

### ⚙️ Dependencies
<table>
  <thead>
    <tr>
      <th>Name</th>
      <th>Severity</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>hyprland</td>
      <td>Required for shell to work</td>
    </tr>
    <tr>
      <td>pipewire</td>
      <td>Required for audio controls and audio to work</td>
    </tr>
    <tr>
      <td>upower</td>
      <td>Required for battery menu to work</td>
    </tr>
    <tr>
      <td>hyprpolkitagent</td>
      <td>Required for polkit to work</td>
    </tr>
    <tr>
      <td>xdg-desktop-portal-hyprland</td>
      <td>Required for xdg-desktop-portal to work</td>
    </tr>
    <tr>
      <td>thunar</td>
      <td>Required for file management</td>
    </tr>
    <tr>
      <td>quickshell</td>
      <td>Required obviously</td>
    </tr>
    <tr>
      <td>alacritty</td>
      <td>Required for terminal functionality</td>
    </tr>
    <tr>
      <td>fish</td>
      <td>Optional for nicer terminal shell</td>
    </tr>
    <tr>
      <td>cava</td>
      <td>Optional for audio visualization</td>
    </tr>
    <tr>
      <td>cowsay</td>
      <td>Optional</td>
    </tr>
    <tr>
      <td>fastfetch</td>
      <td>Optional</td>
    </tr>
  </tbody>
</table>

One liner

Arch
```yay -S pipewire upower hyprland hyprpolkitagent xdg-desktop-portal-hyprland thunar quickshell alacritty fish cava cowsay```

## 💻 Installation
Currently there is no install script however if you have sanity you can install this rice and shell
1. ```yay -Suy quickshell hyprland``` for arch
2. ```git clone https://github.com/1nhp/dotfiles.git```
3. ```cd macos-alike```
4. ```cp -r .config ~/.config```
5. ```cp -r .local/share ~/.local```
6. Press Ctrl + Alt + F(your number like F1) to go to tty
7. Run start-hyprland
8. Done

Check the [wiki](https://github.com/1nhp/dotfiles/wiki) for more information with configuring the dock and the shell

## Credits
[Quickshell](https://github.com/quickshell-mirror/quickshell) its widget toolkit without them this wouldn't been possible!

[ful1e5](https://github.com/ful1e5/apple_cursor) macOS cursors

[Vaxry](https://github.com/hyprwm/Hyprland) Hyprland

