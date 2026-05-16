########################################
# Basic settings
########################################

# Use modern completion system
autoload -Uz compinit
compinit

# Prompt subsystem
autoload -Uz promptinit
promptinit

# History settings (big, useful)
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS       # no dupes
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY
setopt SHARE_HISTORY          # share across sessions
setopt INC_APPEND_HISTORY     # append cmd immediately

# Navigation / quality-of-life
setopt AUTO_CD                # type dir name to cd into it
setopt CORRECT                # spell-correct commands
setopt EXTENDED_GLOB
setopt NO_BEEP
setopt INTERACTIVE_COMMENTS   # allow comments in cmd line
setopt COMPLETE_IN_WORD

# Case-insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

########################################
# Colors
########################################

# Enable and use 256-color support
export TERM=${TERM:-xterm-256color}
autoload -Uz colors && colors
eval $(thefuck --alias)
# LS colors (Linux: uses dircolors if available)
if command -v dircolors >/dev/null 2>&1; then
  eval "$(dircolors -b)"
fi
export CLICOLOR=1

# Grep and friends with color
export GREP_OPTIONS='--color=auto'
export LESS='-R'

########################################
# Plugins (manual, lightweight)
########################################
# Make sure these dirs exist and you have cloned the plugins there
# (instructions below).

ZSH_PLUGIN_DIR="$HOME/.zsh/plugins"

# 1) Fish-like autosuggestions
if [ -f "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
  source "$ZSH_PLUGIN_DIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
  # Subtle grey hint style
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi

# 2) Syntax highlighting
if [ -f "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
  source "$ZSH_PLUGIN_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

# 3) History substring search (up/down through matching history like fish)
if [ -f "$ZSH_PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh" ]; then
  source "$ZSH_PLUGIN_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"

  # Bind up/down arrows for substring search
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

########################################
# fzf integration (optional but awesome)
########################################

# If you installed fzf via its installer (~/.fzf), this will hook it in:
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Use Ctrl-R with fzf to search history if fzf is installed
if command -v fzf >/dev/null 2>&1; then
  # FZF history search with nice preview
  fzf-history-widget() {
    BUFFER=$(fc -l 1 | fzf --tac --no-sort --height 40% --reverse | sed 's/ *[0-9]* *//')
    CURSOR=${#BUFFER}
    zle redisplay
  }
  zle -N fzf-history-widget
  bindkey '^R' fzf-history-widget
fi

########################################
# Completion styling (colors & layout)
########################################

# Pretty completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:messages' format '%F{magenta}%d%f'
zstyle ':completion:*:warnings' format '%F{red}%d%f'

# Group matches by type
zstyle ':completion:*' group-name ''

########################################
# Prompt (Starship)
########################################

eval "$(starship init zsh)"

########################################
# Alias & shortcuts
########################################

# Colorful ls variants
if ls --color=auto >/dev/null 2>&1; then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi
alias bb='tgpt'
alias ll='ls -lh'
alias la='ls -lah'
alias gs='git status -sb'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias ..='cd ..'
alias ...='cd ../..'
alias hx='helix'
# Edit this config quickly
alias ez='${EDITOR:-nvim} ~/.zshrc'
alias cls='clear'
alias l='lsd'
alias vimgo='sudo vimgo'
########################################
# Path tweaks (optional)
########################################

# Add user bin & local bin
export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

########################################
# Final touches
########################################

# Make sure prompt updates properly
setopt PROMPT_SUBST


# bun completions
[ -s "/home/suryansh/.bun/_bun" ] && source "/home/suryansh/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="$PATH:~/essentialbuilds/i386-elf-7.5.0-Linux-x86_64/bin/*"
export PATH="$PATH:~/essentialbuilds/i386-elf-7.5.0-Linux-x86_64/bin/i386-elf-as"
# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/suryansh/.opam/opam-init/init.zsh' ]] || source '/home/suryansh/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration
export ANDROID_HOME="$HOME/android-sdk"
export PATH="$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools"
export PATH=~/.npm-global/bin:$PATH

# Launch Fastfetch on startup
fastfetch
