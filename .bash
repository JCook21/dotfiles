# Some bash customisations
#Tmux config
alias tmux="tmux -2"
export TERM=screen-256color
# Alias for composer. Allows command line apc to be enabled but assumes global installation of composer.
alias composer="php -d apc.enable_cli=0 `which composer`"
