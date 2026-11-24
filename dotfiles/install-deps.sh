#!/usr/bin/env bash
set -euo pipefail

if [[ ${1:-} == --packages ]]; then
    if ! command -v dnf >/dev/null; then
        echo 'System package installation requires Fedora with DNF.' >&2
        exit 1
    fi
    sudo dnf install git zsh neovim ripgrep clang-tools-extra wl-clipboard xclip
    shift
fi

if (( $# )); then
    echo 'Usage: install-deps.sh [--packages]' >&2
    exit 2
fi

for command in git zsh nvim rg; do
    if ! command -v "$command" >/dev/null; then
        printf 'Missing %s. On Fedora, rerun with --packages.\n' "$command" >&2
        exit 1
    fi
done

nvim --headless -u NONE -i NONE \
    '+if !has("nvim-0.11") | cquit | endif' +qa || {
    echo 'Neovim 0.11 or newer is required.' >&2
    exit 1
}

oh_my_zsh=${ZSH:-"$HOME/.oh-my-zsh"}
custom_dir=${ZSH_CUSTOM:-"$oh_my_zsh/custom"}

clone_if_missing() {
    local url=$1 destination=$2 entry_point=$3

    if [[ -f "$destination/$entry_point" ]]; then
        printf 'Using %s\n' "$destination"
        return
    fi
    if [[ -e "$destination" || -L "$destination" ]]; then
        printf 'Missing %s in existing directory %s\n' "$entry_point" "$destination" >&2
        return 1
    fi
    mkdir -p -- "$(dirname -- "$destination")"
    git clone --depth 1 "$url" "$destination"
}

clone_if_missing https://github.com/ohmyzsh/ohmyzsh.git \
    "$oh_my_zsh" oh-my-zsh.sh
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions.git \
    "$custom_dir/plugins/zsh-autosuggestions" zsh-autosuggestions.plugin.zsh
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "$custom_dir/plugins/zsh-syntax-highlighting" zsh-syntax-highlighting.plugin.zsh
