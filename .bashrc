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
export PATH="$HOME/.cargo/bin:$PATH"


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


eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# HSTR configuration
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
function hstrnotiocsti {
    { READLINE_LINE="$( { </dev/tty hstr ${READLINE_LINE}; } 2>&1 1>&3 3>&- )"; } 3>&1;
    READLINE_POINT=${#READLINE_LINE}
}
if [[ $- =~ .*i.* ]]; then bind -x '"\C-h": "hstrnotiocsti"'; fi
export HSTR_TIOCSTI=n

