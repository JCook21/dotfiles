export TERM=xterm-256color
export EDITOR=vim
export HISTSIZE=1000
export HISTFILESIZE=1000
export GPG_TTY=`tty`
export HOMEBREW_INSTALL_CLEANUP=1
export JAVA_HOME=`/usr/libexec/java_home`
export XDEBUG_HOST=`ipconfig getifaddr en0`
if type nvim > /dev/null 2>&1; then
	alias vim='nvim'
	alias vi='nvim'
	alias oldvim='vim'
fi
