# Some bash customisations
export TERM=screen-256color
alias tmux="tmux -2"
# Alias for composer. Allows command line apc to be enabled but assumes global installation of composer.
alias composer="php -d apc.enable_cli=0 `which composer`"
# Add Git Branch info to the prompt
parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Smiley faces and git branch info!
PS1="\[\e[01;36m\]\u@\h \[\e[01;34m\]\w \`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]:)'; else echo -e '\[\e[01;31m\]:('; fi\` \[\e[01;35m\]\$(parse_git_branch) \[\e[01;34m\]$\[\e[00m\] "
