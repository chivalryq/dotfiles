

if [[ $- == *i* ]]; then
	k9s-widget() {
		k9s
	}

	zle     -N   k9s-widget 
	# bind ctrl-space
	bindkey '^ ' k9s-widget 
	#bindkey '^M' k9s-widget 
fi
