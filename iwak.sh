#!/bin/bash

FISH_PATH=$(command -v fish)

install_fish() {
    echo ">> Installing fish shell..."

    if command -v pkg >/dev/null 2>&1; then
        echo ">> Detected Termux (pkg)..."
        pkg update -y && pkg install fish -y
    elif command -v apt >/dev/null 2>&1; then
        echo ">> Detected Linux (apt)..."
        apt update -y && apt install fish -y
    else
        echo "!! No supported package manager found (apt/pkg)"
        exit 1
    fi

    FISH_PATH=$(command -v fish)
    if [ -z "$FISH_PATH" ]; then
        echo "!! Fish shell installation failed."
        exit 1
    fi

    if [ -f /etc/shells ] && ! grep -Fxq "$FISH_PATH" /etc/shells; then
        echo "$FISH_PATH" >> /etc/shells
        echo ">> Added $FISH_PATH to /etc/shells"
    fi

    if command -v chsh >/dev/null 2>&1; then
        chsh -s "$FISH_PATH"
        echo ">> Set fish as default shell"
    fi

    if [[ "$PREFIX" == *"com.termux"* ]]; then
        echo "exec fish" >> ~/.bashrc
        echo ">> Added fish to .bashrc (Termux)"
    fi

    echo ">> ✅ Fish installed and set as default shell."
}

uninstall_fish() {
    echo ">> Uninstalling fish shell..."

    if [[ "$PREFIX" == *"com.termux"* ]]; then
        sed -i '/exec fish/d' ~/.bashrc
        echo ">> Removed fish from .bashrc"
    fi

    if command -v chsh >/dev/null 2>&1; then
        chsh -s "/bin/bash"
        echo ">> Reverted to bash shell"
    fi

    if command -v pkg >/dev/null 2>&1; then
        pkg uninstall fish -y
    elif command -v apt >/dev/null 2>&1; then
        apt remove fish -y
    fi

    if [ -f /etc/shells ] && [ -n "$FISH_PATH" ]; then
        sed -i "\|$FISH_PATH|d" /etc/shells
        echo ">> Removed $FISH_PATH from /etc/shells"
    fi

    echo ">> ✅ Fish shell uninstalled."
}

case "$1" in
    install)
        install_fish
        ;;
    uninstall)
        uninstall_fish
        ;;
    *)
        echo "Usage: $0 [install|uninstall]"
        ;;
esac
