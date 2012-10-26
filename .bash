# Some bash customisations
export TERM=xterm-256color
#Tmux config
[ -n "$TMUX" ] && export TERM=screen-256color
# Alias for composer. Allows command line apc to be enabled but assumes global installation of composer.
alias composer="php -d apc.enable_cli=0 `which composer`"
