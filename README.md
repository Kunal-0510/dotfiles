
# 🖥️ My Dotfiles & Setup

A curated collection of configuration files and install scripts for my Arch Linux + Hyprland environment.

## ⚙️ Dotfiles

### 1. Code Editor: Neovim 📝  
Configuration folder:  


### 2. Shell: Zsh + Oh My Posh 🌟  
- Theme JSON at `~/.poshthemes/tokyonight_storm.omp.json`  
- In your `~/.zshrc`, add:

```bash
source /usr/share/oh-my-posh/oh-my-posh.sh
eval "$(oh-my-posh init zsh --config ~/.poshthemes/tokyonight_strom.omp.json)"
```

### 3. GRUB Configuration: grubConf 🔧  
Add NVIDIA modules for early boot. Edit `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
GRUB_MODULES="nvidia nvidia_modeset nvidia_uvm nvidia_drm"
```

Regenerate GRUB config:
```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg 
```

## 📦 Install Scripts

- 🖥️ Neovide - GUI for Neovim
- 🗂️ **Yazi** – Terminal file explorer
- 🐳 **Docker** – Container management
- ⚡ **Zoxide** – Fast directory jumping


## 🔧 Troubleshooting & Error Fixes

### Kernel Panic on Boot 🧐

**Symptom:** System panics at boot complaining about missing NVIDIA modules.  
**Solution:**
1. Verify GPU & drivers:
2. Ensure GRUB loads them (see [GRUB Configuration](#3-grub-configuration-grubconf)).  
3. Reboot and confirm.

```bash
nvidia-smi
lsmod | grep nvidia

```

> **Tip:** For a step-by-step Arch + NVIDIA guide, see the link below.

## 🔗 References

- [NVIDIA on Arch guide](https://github.com/korvahannu/arch-nvidia-drivers-installation-guide)
- [Oh My Posh docs](https://ohmyposh.dev/docs/)

###### © xeroEngine

