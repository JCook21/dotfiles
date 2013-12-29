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

antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme agnoster
antigen-apply

# Disable automatic terminal title setting. This messes up Tmux if it's on.
DISABLE_AUTO_TITLE="true"

export TERM=xterm-256color

eval `dircolors ~/.dircolors`

# Display red dots while waiting for completion.
COMPLETION_WAITING_DOTS="true"

setopt autocd

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/vagrant/bin:/home/jcook/projects/boris/vendor/bin

# Alias for composer. Allows command line apc to be enabled but assumes global installation of composer.
alias composer="php -d apc.enable_cli=0 /usr/local/bin/composer"

# Coloured output for man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS=-r
export EDITOR=vim

# Load in local settings from ~/.zsh_profile
if [ -e ~/.zsh_profile ]
then
        source ~/.zsh_profile
fi
