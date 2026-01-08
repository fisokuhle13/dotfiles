# -----------------------------------------------------
# INIT
# -----------------------------------------------------

# -----------------------------------------------------
# Exports
# -----------------------------------------------------
export EDITOR=nvim
set -o vi

export PATH="/usr/lib/ccache/bin/:$PATH"

# Custom binaries
export PATH="$HOME/.bin:$PATH"

# -----------------------------------------------------
# AUTOSTART
# -----------------------------------------------------

# Initialize Rust
#source $HOME/.cargo/env


# Initialize Starship
eval "$(starship init bash)"

eval "$(zoxide init bash)"

# FZF history search
fzf_history() {
  local selected_command
  selected_command=$(history | fzf +s --tac | sed 's/^[ ]*[0-9]\+[ ]*//')
  if [ -n "$selected_command" ]; then
    READLINE_LINE="$selected_command"
    READLINE_POINT=${#READLINE_LINE}
  fi
}

bind -x '"\C-r": fzf_history'

# FZF process search for kill command
_fzf_kill_process() {
  local pid
  pid=$(ps -eo pid,comm --sort=pid | fzf --height 40% --reverse --border | awk '{print $1}')
  if [ -n "$pid" ]; then
    echo "$pid"
  fi
}

# Enable tab completion for kill command
complete -F _fzf_kill_process kill

# Go
export PATH=$PATH:/usr/bin

grep -qxF 'if [[ ":$PATH:" != *":$HOME/go/bin:"* ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi' ~/.bashrc || cat <<'EOF' >>~/.bashrc
# Add Go bin to PATH if not already present
if [[ ":$PATH:" != *":$HOME/go/bin:"* ]]; then
  export PATH="$HOME/go/bin:$PATH"
fi
EOF

# For GNU ls - enables color for all ls commands
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

# SSH Agent
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

