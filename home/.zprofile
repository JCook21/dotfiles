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
