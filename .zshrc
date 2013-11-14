source ~/dotfiles/antigen/antigen.zsh

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

DEFAULT_USER="jeremy"
export GPGKEY=FE59B8EC
set -o vi
bindkey ^R history-incremental-search-backward
# key bindings
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word
bindkey "^H" backward-delete-word
# for rxvt
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
# for non RH/Debian xterm, can't hurt for RH/DEbian xterm
bindkey "\eOH" beginning-of-line
bindkey "\eOF" end-of-line
# for freebsd console
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
# completion in the middle of a line
bindkey '^i' expand-or-complete-prefix
