# Zsh and Neovim dotfiles

Run this from the repository root on Fedora to install system packages, Oh My Zsh, and the Zsh plugins, then link the configs into your home directory.

```sh
./dotfiles/install.sh --packages
```

If Git, Zsh, Neovim 0.11+, and ripgrep are already installed, run `./dotfiles/install.sh` without flags. Use `./dotfiles/install-deps.sh` with the same optional flag to install dependencies without linking configs.

The installer uses `~/.zshrc` and `~/.config/nvim` by default and honors `ZDOTDIR`, `XDG_CONFIG_HOME`, and `NVIM_APPNAME`. It moves existing configs into adjacent backup directories and prints their paths. To restore a config, remove the new symlink and move the saved file or directory back to its original location. Keep this checkout in place while using the links.

Open a new Zsh session to load the Eastwood theme, Git shortcuts, autosuggestions, and syntax highlighting. Oh My Zsh and its plugins live under `~/.oh-my-zsh` by default. The config also respects `ZSH` and `ZSH_CUSTOM` if you export them before running the installer and starting Zsh.

Neovim uses built-in features for file browsing, completion, and language server support. Press Space then `u` to open the keybinding guide, or Space then `g` to search the project with ripgrep. Language support activates when `clangd`, `pyright-langserver`, or `marksman` is on your PATH. The Fedora package list includes `clangd` and clipboard utilities for Wayland and X11. Pyright and Marksman are optional separate installs.
