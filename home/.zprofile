# Colored man pages (from https://wiki.archlinux.org/index.php/Man_Page#Colored_man_pages)
man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;47;34m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# Work specific config
alias p4='noglob p4'

set -a
. ~/.p4config
set +a

# See the currently synced revision for a given repo path
p4have () {
	if [ "$#" -ne 1 ]
	then
		echo "Usage: p4have BRANCH"
		return 1
	fi
	p4 cstat //depot/$1/... | awk '/have/{print line}{line=$0}' | tail -1
}

# See the revisions that we don't have
p4need () {
	if [ "$#" -ne 1 ]
	then
		echo "Usage: p4need BRANCH"
		return 1
	fi
	p4 cstat //depot/$1/... | awk '/need/{print line}{line=$0}'
}

tmuxgo () {
	SESSION='NetSuite'

	tmux new-session -d -s $SESSION

	tmux rename-window -t $SESSION:1 'Shell'
	tmux new-window -t $SESSION -a -n 'ScrumBox'
	tmux new-window -t $SESSION -a -n 'Devbox'
	tmux send-keys -t $SESSION "cd /webdev" Enter
	tmux send-keys -t $SESSION "clear" Enter
	tmux select-window -t $SESSION:1
	tmux attach -t $SESSION
}
