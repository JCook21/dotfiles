# Antigen config
# Use Antigen to manage all ZSH plugins
source ~/.antigen/antigen.zsh
antigen init $HOME/.antigenrc

# Ensure that /usr/local/bin has precedence over /usr/bin
export PATH=/usr/local/bin:$PATH

# Remove the user name from the status line.
DEFAULT_USER=`whoami`

# Disable automatic terminal title setting. This messes up Tmux if it's on.i
DISABLE_AUTO_TITLE="true"

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Automatically use cd when paths are entered without cd
setopt autocd autopushd

# append command to history file once executed
setopt inc_append_history

# Keep history search with vim mode enabled.
bindkey '^R' history-incremental-search-backward

# Use vim keybindings
bindkey -v

# Allow terminal commands to be edited in $EDITOR
autoload -U edit-command-line

# Load the iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load rbenv
if [ -x /usr/local/bin/rbenv ]; then
	eval "$(rbenv init -)"
fi
