#!/usr/bin/env bash
set -euo pipefail

dotfiles_dir=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd -P)
"$dotfiles_dir/install-deps.sh" "$@"

link_config() {
    local source=$1 target=$2 backup

    if [[ -L "$target" && $(readlink -- "$target") == "$source" ]]; then
        return
    fi

    mkdir -p -- "$(dirname -- "$target")"
    if [[ -e "$target" || -L "$target" ]]; then
        backup=$(mktemp -d -- "$target.backup.XXXXXXXX")
        mv -- "$target" "$backup/"
        printf 'Backed up %s to %s/\n' "$target" "$backup"
    fi

    ln -sT -- "$source" "$target"
    printf 'Linked %s -> %s\n' "$target" "$source"
}

link_config "$dotfiles_dir/.zshrc" "${ZDOTDIR:-$HOME}/.zshrc"
link_config "$dotfiles_dir/nvim" "${XDG_CONFIG_HOME:-"$HOME/.config"}/${NVIM_APPNAME:-nvim}"
