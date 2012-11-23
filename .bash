# Some bash customisations
export TERM=screen
alias tmux="tmux -2"
# Alias for composer. Allows command line apc to be enabled but assumes global installation of composer.
alias composer="php -d apc.enable_cli=0 `which composer`"
