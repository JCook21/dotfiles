# Antigen config
# Use Antigen to manage all ZSH plugins
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
if [ "$OSTYPE"="darwin11.0" ]; then
    antigen bundle osx
fi
antigen bundles <<EOBUNDLES
	git
	git-extras
	gitignore
	tmux
	vagrant
	gem
	ruby
	brew
	vundle
	vi-mode
	colored-man-pages
	ssh-agent
	chrissicool/zsh-256color
	pinelibg/dircolors-solarized-zsh
	zsh-users/zsh-completions
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-syntax-highlighting
EOBUNDLES
antigen theme agnoster

antigen apply

# General ZSH config
# Ensure that /usr/local/bin has precedence over /usr/bin
export PATH=/usr/local/bin:$PATH

# Remove the user name from the status line.
DEFAULT_USER=`whoami`

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Automatically use cd when paths are entered without cd
setopt autocd autopushd

# append command to history file once executed
setopt inc_append_history

# Keep history search with vim mode enabled.
bindkey '^R' history-incremental-search-backward

# Load the iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load rbenv
if [ -x /usr/local/bin/rbenv ]; then
	eval "$(rbenv init -)"
fi
