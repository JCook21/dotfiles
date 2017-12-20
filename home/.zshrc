source ~/.homesick/repos/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh
antigen bundles <<EOBUNDLES
	 git
	 git-extras
	 tmux
	 vagrant
	 gem
	 ruby
	 rvm
	 brew
	 npm
	 vundle
	 zsh-users/zsh-syntax-highlighting
	 gradle
	 chucknorris
EOBUNDLES

antigen theme agnoster
antigen apply

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

# Keep history search with vim mode enabled.
bindkey '^R' history-incremental-search-backward

autoload -U edit-command-line

# Add support for colors in ls
if whence dircolors >/dev/null; then
  eval "$(dircolors -b)"
  zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
  alias ls='ls --color'
else
  export CLICOLOR=1
  zstyle ':completion:*:default' list-colors ''
fi

# Load in local settings from ~/.zsh_profile
test -e "${HOME}/.zsh_profile" && source "${HOME}/.zsh_profile"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
