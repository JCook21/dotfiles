# Antigen config
# Use Antigen to manage all ZSH plugins
source ~/.antigen/antigen.zsh
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
	osx
	bundler
	npm
	git
	gitignore
	tmux
	history
	vagrant
	gem
	brew
	vi-mode
	colored-man-pages
	ssh-agent
	composer
	docker
	ruby
	jessarcher/zsh-artisan
	chrissicool/zsh-256color
	zsh-users/zsh-completions
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-history-substring-search
EOBUNDLES
# Powerlevel9k theme config
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k
POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs root_indicator background_jobs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status vi_mode command_execution_time time)
POWERLEVEL9K_VI_INSERT_MODE_STRING=''
POWERLEVEL9K_SHORTEN_STRATEGY='truncate_middle'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# General ZSH config
# Ensure that /usr/local/bin has precedence over /usr/bin
export PATH=/usr/local/bin:$PATH

# Make the completion highlight colour more legible
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

# Remove the user name from the status line.
DEFAULT_USER=`whoami`

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

#Auto title is a little weird with tmux.
DISABLE_AUTO_TITLE="true"

# Automatically use cd when paths are entered without cd
setopt autocd autopushd

# append command to history file once executed
setopt incappendhistory
HISTDUP=erase

# Offer correction options for misspelled commands.
setopt correctall

# Use history searching with up and down arrows
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
setopt HIST_IGNORE_ALL_DUPS

# Use Shift-Tab to go backwards through completion suggestions
bindkey '^[[Z' reverse-menu-complete

# Load the iterm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Load rbenv
if [ -x /usr/local/bin/rbenv ]; then
	eval "$(rbenv init -)"
fi
