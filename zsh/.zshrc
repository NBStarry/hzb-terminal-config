# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# zsh-autosuggestions / zsh-syntax-highlighting (installed via Homebrew):
#   brew install zsh-autosuggestions zsh-syntax-highlighting
if command -v brew >/dev/null 2>&1; then
  HOMEBREW_PREFIX="$(brew --prefix)"
  [ -f "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && \
    source "$HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  [ -f "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ] && \
    source "$HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  unset HOMEBREW_PREFIX
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$("$HOME/miniconda3/bin/conda" 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

export PATH="$HOME/.local/bin:$PATH"

# LiteLoaderQQNT - 插件数据目录
export LITELOADERQQNT_PROFILE="$HOME/.liteloader"

# bun completions
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# claude-mem worker (path may vary depending on plugin install location)
alias claude-mem='bun "$HOME/.claude/plugins/marketplaces/thedotmack/plugin/scripts/worker-service.cjs"'

# opencode
export PATH="$HOME/.opencode/bin:$PATH"

# attach 到本机 opencode serve, 用当前目录作 working dir
alias oc-attach='opencode attach http://127.0.0.1:4096 --dir "$PWD"'
alias oc-continue='opencode attach http://127.0.0.1:4096 --dir "$PWD" --continue'

# ============================================================
# Machine-specific / sensitive config (NOT committed).
# Put KUBECONFIG, proxy settings, private aliases, etc. here.
# See zsh/.zshrc.local.example for a template.
# ============================================================
[ -f "$HOME/.zshrc.local" ] && source "$HOME/.zshrc.local"

# GitHub MCP server token (复用 gh CLI 凭证) — 由 claude /doctor 修复添加
export GITHUB_PERSONAL_ACCESS_TOKEN="$(gh auth token 2>/dev/null)"

