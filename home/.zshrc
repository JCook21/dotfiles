# Antigen config
# Use Antigen to manage all ZSH plugins
source ~/.antigen/antigen.zsh
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export NVM_COMPLETION=true
export NVM_LAZY_LOAD=true
antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
	osx
	bundler
	npm
	nvm
	node
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
	gpg-agent
	docker
	ruby
	jsontools
	jenv
	chrissicool/zsh-256color
	zsh-users/zsh-completions
	zsh-users/zsh-autosuggestions
	zsh-users/zsh-syntax-highlighting
	zsh-users/zsh-history-substring-search
	MichaelAquilina/zsh-you-should-use
	lukechilds/zsh-nvm
EOBUNDLES
source ~/.p10k.zsh

antigen theme romkatv/powerlevel10k

antigen apply

# General ZSH config
# Ensure that /usr/local/bin has precedence over /usr/bin
export PATH=/usr/local/bin:/usr/local/sbin:$PATH

# Display alias suggestions after the output of the command
export YSU_MESSAGE_POSITION="after"

# Make the completion highlight colour more legible
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

# Remove the user name from the status line.
DEFAULT_USER=`whoami`

# Display red dots while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Auto title is a little weird with tmux.
DISABLE_AUTO_TITLE="true"

# Automatically use cd when paths are entered without cd
setopt autocd autopushd

# Allow completion for aliases
setopt no_complete_aliases

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

bindkey -M vicmd v edit-command-line

# Use Shift-Tab to go backwards through completion suggestions
bindkey '^[[Z' reverse-menu-complete

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
