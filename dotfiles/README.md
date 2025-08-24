#  Dotfiles Configuration

This folder contains my personal configuration files (**dotfiles**) for setting up a customized Unix/Linux development environment. It includes settings for:

- `zsh` (`.zshrc`)
- `vim` (`.vimrc`)
- User-level configurations inside `.config/` (e.g., for tools like `nvim`, `tmux`, etc.)

## 📁 Folder Structure

dotfiles/
├── .vimrc
├── .zshrc
└── .config/
├── nvim/
├── tmux/
└── (etc.)


## Usage Instructions

You can either:

### Option 1: Copy Files Manually
```bash
cp dotfiles/.vimrc ~/
cp dotfiles/.zshrc ~/
cp -r dotfiles/.config/* ~/.config/

```
### Option 2: Create Symbolic Links
```bash
ln -sf ~/path/to/dotfiles/.vimrc ~/.vimrc
ln -sf ~/path/to/dotfiles/.zshrc ~/.zshrc
ln -sfn ~/path/to/dotfiles/.config ~/.config
```
