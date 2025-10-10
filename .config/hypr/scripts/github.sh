#!/usr/bin/env bash
# Add GitHub SSH key to global agent

KEY="$HOME/.ssh/id_ed25519_github_new"
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"

# Wait until agent is ready
for i in {1..20}; do
    if [ -S "$SSH_AUTH_SOCK" ]; then
        break
    fi
    sleep 0.1
done

# Add key if not already loaded
if [ -S "$SSH_AUTH_SOCK" ]; then
    if ! ssh-add -l 2>/dev/null | grep -q "$KEY"; then
        ssh-add "$KEY" >/dev/null 2>&1
        echo "✅ GitHub SSH key added to agent"
    fi
else
    echo "⚠️ SSH agent socket not found at $SSH_AUTH_SOCK"
fi
