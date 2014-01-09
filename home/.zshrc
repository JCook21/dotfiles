source ~/.homesick/repos/dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh
antigen-bundle git
antigen-bundle git-extras
antigen-bundle capistrano
antigen-bundle composer
antigen-bundle phing
antigen-bundle symfony2
antigen-bundle symfony
antigen-bundle svn
antigen-bundle tmux
antigen-bundle debian
antigen-bundle supervisor
antigen-bundle svn
antigen-bundle command-not-found
antigen-bundle vagrant
antigen-bundle gem
antigen-bundle ruby
antigen-bundle rvm
antigen-bundle bundler

antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme agnoster
antigen-apply

# Disable automatic terminal title setting. This messes up Tmux if it's on.
DISABLE_AUTO_TITLE="true"

# Set solarized colours for directories.
eval `dircolors ~/.dircolors`

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Automatically use cd when paths are entered without cd
setopt autocd

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/vagrant/bin:$HOME/projects/boris/vendor/bin:$HOME/.rvm/bin

# Alias for composer. Allows command line apc to be enabled but assumes global installation of composer.
alias composer="php -d apc.enable_cli=0 /usr/local/bin/composer"

# Make sure vim loads without requiring the X11 libraries.
alias vim="vim -X"

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

# Load in local settings from ~/.zsh_profile
if [ -e ~/.zsh_profile ]
then
        source ~/.zsh_profile
fi
