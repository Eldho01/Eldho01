export ZSH="${ZSH:-$HOME/.oh-my-zsh}"
ZSH_CUSTOM="${ZSH_CUSTOM:-$ZSH/custom}"
ZSH_THEME="eastwood"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
zstyle ':omz:update' mode reminder

if [[ -r "$ZSH/oh-my-zsh.sh" ]]; then
  source "$ZSH/oh-my-zsh.sh"
fi

HISTFILE="$HOME/.zsh_history"
HISTSIZE=20000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS

bindkey -e
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward
bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

alias vim='nvim'

export PATH="$HOME/.local/bin:$PATH"
