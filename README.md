# Fish Shell Installer for Termux & Linux

A simple bash script to automatically install or uninstall **Fish Shell** on Termux and Linux (APT-based) systems.

## 🐟 Features

- Automatically detects Termux (`pkg`) or Linux (`apt`)
- Installs Fish Shell automatically
- Adds Fish to `/etc/shells` if not present
- Sets Fish as the default shell using `chsh` (or uses `.bashrc` for Termux)
- Supports clean uninstallation with optional `chsh` reset

---

## 📥 Installation

```bash
curl -fsSL https://raw.githubusercontent.com/salomonorg/Auto-Completion-Commands/refs/heads/main/iwak.sh | bash -s install
```

---

## 🗑️ Uninstallation

```bash
curl -fsSL https://raw.githubusercontent.com/salomonorg/Auto-Completion-Commands/refs/heads/main/iwak.sh | bash -s uninstall
```

---

## 🖼️ Screenshots

**📱 Android (Termux)**  
![Termux Screenshot](https://raw.githubusercontent.com/salomonorg/Auto-Completion-Commands/refs/heads/main/Screenshot_20250718-084124.png)

**💻 VPS (Ubuntu)**  
![Ubuntu Screenshot](https://raw.githubusercontent.com/salomonorg/Auto-Completion-Commands/refs/heads/main/Screenshot_20250718-084018.png)
