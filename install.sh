#!/usr/bin/env bash
# Symlink terminal config files into place. Backs up any existing files first.
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.terminal-config-backup-$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mkdir -p "$BACKUP_DIR"
    mv "$dest" "$BACKUP_DIR/"
    echo "backed up existing $dest -> $BACKUP_DIR/"
  fi
  ln -s "$src" "$dest"
  echo "linked $dest -> $src"
}

# zsh
link "$REPO_DIR/zsh/.zshrc" "$HOME/.zshrc"

# ghostty (XDG config + macOS App Support override for quick-terminal-size bug)
link "$REPO_DIR/ghostty/config" "$HOME/.config/ghostty/config"
link "$REPO_DIR/ghostty/config.appsupport" \
     "$HOME/Library/Application Support/com.mitchellh.ghostty/config"

echo
echo "Done. Next steps:"
echo "  1. cp $REPO_DIR/zsh/.zshrc.local.example ~/.zshrc.local   # then fill in KUBECONFIG/proxy/etc."
echo "  2. brew install oh-my-zsh? -> sh -c \"\$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)\""
echo "  3. brew install zsh-autosuggestions zsh-syntax-highlighting"
echo "  4. Install font 'Maple Mono NF CN' for Ghostty"
echo "  5. exec zsh   # reload"
