export TERM=xterm-256color
export EDITOR=vim
export HISTSIZE=100000
export HISTFILESIZE=100000
export GPG_TTY=`tty`
export HOMEBREW_INSTALL_CLEANUP=1
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
	alias vi-'nvim'
	alias oldvim='vim'
fi
