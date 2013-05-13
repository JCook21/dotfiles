source ~/dotfiles/antigen.zsh

antigen-lib
antigen-bundle git
antigen-bundle capistrano
antigen-bundle composer
antigen-bundle phing
antigen-bundle symfony2
antigen-bundle svn
antigen-bundle tmux
antigen-bundle debian

antigen-bundle zsh-users/zsh-syntax-highlighting

antigen-theme agnoster
#antigen-theme dpoggi

antigen-apply
# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

setopt autocd

# Customize to your needs...
export PATH=/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/vagrant/bin

# Force Tmux to use 256 colours
export TERM=screen-256color
alias tmux="tmux -2"

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
