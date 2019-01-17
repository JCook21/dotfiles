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
# Powerlevel9k theme config
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs vi_mode history time)
POWERLEVEL9K_VI_INSERT_MODE_STRING=''

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

# General ZSH config
# Ensure that /usr/local/bin has precedence over /usr/bin
export PATH=/usr/local/bin:$PATH

# Remove the user name from the status line.
DEFAULT_USER=`whoami`

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

#Auto title is a little weird with tmux.
DISABLE_AUTO_TITLE="true"

# Automatically use cd when paths are entered without cd
setopt autocd autopushd

# append command to history file once executed
setopt inc_append_history

# Offer correction options for misspelled commands.
setopt correctall

# Keep history search with vim mode enabled.
bindkey '^R' history-incremental-search-backward

# Load the iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load rbenv
if [ -x /usr/local/bin/rbenv ]; then
	eval "$(rbenv init -)"
fi
