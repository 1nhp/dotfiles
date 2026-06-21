#!/bin/sh

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m'

STAGE=1
TOTAL_FOLDERS=2
COPIED_FOLDERS=0

status() {
    clear

    case "$STAGE" in
        1) TEXT="Installing dependencies..." ;;
        2) TEXT="Copying files..." ;;
        3) TEXT="Cleaning up..." ;;
        4) TEXT="Finished" ;;
    esac

    printf '%b\n' "${YELLOW}STEP ${STAGE}${NC} ${TEXT}"
    printf '%s\n' "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
}

fail() {
    printf '%b\n' "${RED}$1${NC}" >&2
    exit 1
}

copy_folder() {
    SRC=$1
    DEST=$2

    printf 'Copying %s...\n' "$SRC"

    if cp -r "$SRC" "$DEST"; then
        COPIED_FOLDERS=$((COPIED_FOLDERS + 1))
        printf '%b\n' "${GREEN}[$COPIED_FOLDERS/$TOTAL_FOLDERS] Success${NC}"
    else
        fail "Failed to copy '$SRC'"
    fi
}

install_dependencies() {
    status

    yay -S \
        pipewire \
        upower \
        hyprland \
        hyprpolkitagent \
        xdg-desktop-portal-hyprland \
        thunar \
        quickshell \
        alacritty \
        fish \
        cava \
        cowsay \
        --noconfirm \
        --needed || fail "Dependency installation failed."
}

cleanup() {
    status
    echo a
    rm -rf "../../dotfiles"
}

main() {
    git clone https://github.com/1nhp/dotfiles.git
    cd dotfiles/macos-alike

    install_dependencies
    STAGE=2
    status
    copy_folder ".config" "~/"
    copy_folder ".local" "~/"
    STAGE=3
    cleanup
    STAGE=4
    status
    printf '\n%b\n' "${GREEN}MacOS Alike Shell for Hyprland installed successfully. Enjoy!${NC}"
}

main "$@"
