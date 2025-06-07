**Dotfiles**
- Code editor -> neovim
- Shell -> zsh with ohmyposh
- ohmyposh -> contains .json updated
- grubConf -> Necessary changes to correctly load Nvidia drivers in the boot time

**Libraries**
- Yazi -> Terminal file explorer
- Docker -> To maintain packages

Hyprland -> ML4W

== Error Fixes ==

**Kernel Panic**
*Solution* -> add drivers to boot time. Use these command to see GPU and which drivers are in use. Adding them in Linux default works.

```bash
nvidia-smi
lsmod | grep nvidia
```

[Nvidia kernel setup in arch](https://github.com/korvahannu/arch-nvidia-drivers-installation-guide) -> Use this link for refernce.



