export ZSH="$HOME/.oh-my-zsh"

# Prompt 交给 Starship
ZSH_THEME=""

plugins=(
  git
  macos
  brew
  gh
  sudo
  extract
  zsh-autosuggestions
)

source "$ZSH/oh-my-zsh.sh"

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# Modern CLI
source <(fzf --zsh)
eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd --shell zsh)"
eval "$(starship init zsh)"

# Colored file listing
alias ls="eza --icons=auto --group-directories-first"
alias ll="eza -lah --icons=auto --group-directories-first --git"
alias la="eza -a --icons=auto --group-directories-first"
alias lt="eza --tree --level=2 --icons=auto --group-directories-first"

alias v="nvim"
alias vi="nvim"

# Must remain last
source "${ZSH_CUSTOM:-$ZSH/custom}/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/chqin/miniforge3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/chqin/miniforge3/etc/profile.d/conda.sh" ]; then
        . "/Users/chqin/miniforge3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/chqin/miniforge3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Customized
cleanmac() {
  local root="${1:-.}"

  if [[ ! -d "$root" ]]; then
    print -u2 "cleanmac: directory not found: $root"
    return 1
  fi

  find "$root" -type f \
    \( -name '.DS_Store' -o -name $'Icon\r' \) \
    -print -delete 2>/dev/null
}

# ClashX proxy settings
PROXY_HOST="${PROXY_HOST:-127.0.0.1}"
PROXY_HTTP_PORT="${PROXY_HTTP_PORT:-7890}"
PROXY_SOCKS_PORT="${PROXY_SOCKS_PORT:-7890}"  # Mixed Port

proxy_on() {
  export http_proxy="http://${PROXY_HOST}:${PROXY_HTTP_PORT}"
  export https_proxy="$http_proxy"
  export all_proxy="socks5h://${PROXY_HOST}:${PROXY_SOCKS_PORT}"

  export HTTP_PROXY="$http_proxy"
  export HTTPS_PROXY="$https_proxy"
  export ALL_PROXY="$all_proxy"

  export no_proxy="localhost,127.0.0.1,::1,.local"
  export NO_PROXY="$no_proxy"

  echo "Proxy enabled:"
  env | grep -i '_proxy=' | sort
}

proxy_off() {
  unset HTTP_PROXY HTTPS_PROXY ALL_PROXY NO_PROXY
  unset http_proxy https_proxy all_proxy no_proxy

  echo "Proxy disabled."
}

alias pon="proxy_on"
alias poff="proxy_off"
