source ~/.homesick/repos/dotfiles/antigen/antigen.zsh

# Load in local settings from ~/.zsh_profile
if [ -e ~/.zsh_profile ]
then
        source ~/.zsh_profile
fi

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
	 git
	 git-extras
	 tmux
	 vagrant
	 gem
	 ruby
	 rvm
	 bundler
	 brew
	 npm

	 zsh-users/zsh-syntax-highlighting

EOBUNDLES

antigen-theme agnoster
antigen-apply

# Disable automatic terminal title setting. This messes up Tmux if it's on.
DISABLE_AUTO_TITLE="true"

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Automatically use cd when paths are entered without cd
setopt autocd

# Colored man pages (from https://wiki.archlinux.org/index.php/Man_Page#Colored_man_pages)
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;47;34m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# number of lines kept in history
export HISTSIZE=1000
# number of lines saved in the history after logout
export SAVEHIST=1000
# append command to history file once executed
setopt inc_append_history

# vim mode
#bindkey -v

# Keep history search with vim mode enabled.
bindkey '^R' history-incremental-search-backward

