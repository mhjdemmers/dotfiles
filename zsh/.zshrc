# ~/.zshrc
# Everything below is guarded with `command -v` / `-d` checks, so a fresh machine
# without some tool installed won't throw errors on every new shell.
# Machine-specific stuff (work aliases, hostnames, secrets) goes in ~/.zshrc.local,
# which is NOT in this repo.

# ---------- oh-my-zsh ----------
# Installed separately (see README), not vendored in this repo.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
[ -f "$ZSH/oh-my-zsh.sh" ] && source "$ZSH/oh-my-zsh.sh"

# ---------- environment ----------
export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export COLORTERM=truecolor
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# ---------- fzf (uses fd) ----------
if command -v fzf >/dev/null; then
  source <(fzf --zsh)
  export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
  _fzf_compgen_path() { fd --hidden --exclude .git . "$1"; }
  _fzf_compgen_dir()  { fd --type=d --hidden --exclude .git . "$1"; }
fi

# ---------- language runtimes ----------
# mise replaces pyenv + fnm (Python, Node, Go, etc. in one tool): https://mise.jdx.dev
command -v mise >/dev/null && eval "$(mise activate zsh)"

# Go binaries installed with `go install`
[ -d "$HOME/go/bin" ] && export PATH="$PATH:$HOME/go/bin"

# Haskell (ghcup)
[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env"

# conda: only loads if miniconda is actually installed
if [ -x "$HOME/miniconda3/bin/conda" ]; then
  __conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2>/dev/null)"
  if [ $? -eq 0 ]; then
    eval "$__conda_setup"
  elif [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
    . "$HOME/miniconda3/etc/profile.d/conda.sh"
  fi
  unset __conda_setup
fi

alias venv='source .venv/bin/activate'

# ---------- ssh keys ----------
command -v keychain >/dev/null && eval "$(keychain --eval --quiet id_ed25519 id_rsa 2>/dev/null)"

# ---------- aliases ----------
alias vim=nvim
alias lg=lazygit
alias neofetch=fastfetch
alias hx=helix
alias desk='ssh mareno@desktop-1rjucgu'

if command -v eza >/dev/null; then
  alias ls='eza --group-directories-first --icons --color=always --git'
  alias ll='eza -l --git'
  alias la='eza -la'
fi

# yazi: `y` opens yazi and cd's into the directory you quit in
function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    builtin cd -- "$cwd"
  fi
  rm -f -- "$tmp"
}

# zoxide replaces cd
command -v zoxide >/dev/null && eval "$(zoxide init --cmd cd zsh)"

# ---------- machine-specific overrides ----------
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"
