# Some bash customisations
export TERM=screen-256color
alias tmux="tmux -2"
# Alias for composer. Allows command line apc to be enabled but assumes global installation of composer.
alias composer="php -d apc.enable_cli=0 `which composer`"
# Add Git Branch info to the prompt
parse_git_branch() {
	git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Coloured prompt and git branch info
PS1="\`if [ \$? = 0 ]; then echo -e '\[\e[01;32m\]'; else echo -e '\[\e[01;31m\]'; fi\`\u@\h \[\e[01;34m\]\w \[\e[01;35m\]\$(parse_git_branch) \[\e[01;34m\]$\[\e[00m\] "

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
