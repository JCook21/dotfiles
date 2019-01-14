source ~/.antigen.zsh

antigen init $HOME/.antigenrc

fpath=(/usr/local/share/zsh-completions $fpath)

DEFAULT_USER=`whoami`

# Disable automatic terminal title setting. This messes up Tmux if it's on.
DISABLE_AUTO_TITLE="true"

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Automatically use cd when paths are entered without cd
setopt autocd

# append command to history file once executed
setopt inc_append_history

# Keep history search with vim mode enabled.
bindkey '^R' history-incremental-search-backward

autoload -U edit-command-line

# Add support for colors in ls
if whence ~/dircolors >/dev/null; then
  eval `dircolors ~/dircolors`
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

if [ -x /usr/local/bin/rbenv ]; then
	eval "$(rbenv init -)"
fi
