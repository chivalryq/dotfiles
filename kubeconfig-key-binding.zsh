if [[ $- == *i* ]]; then
  # fleet-context-widget switches kubectl-compatible tools to a Fleet context.
  fleet-context-widget() {
    local config="${FLEETCTL_HOME:-$HOME/.config/fleetctl}/config"
    local selected ret

    if [[ ! -r "$config" ]]; then
      zle -M "fleet kubeconfig not found: $config"
      return 1
    fi

    setopt localoptions pipefail
    selected=$(KUBECONFIG="$config" kubectl config get-contexts -o name | fzf --prompt='fleet context> ')
    ret=$?
    if (( ret == 0 )) && [[ -n "$selected" ]]; then
      KUBECONFIG="$config" kubectl config use-context "$selected" >/dev/null
      ret=$?
      (( ret == 0 )) && export KUBECONFIG="$config"
    fi

    zle reset-prompt
    return $ret
  }

  zle -N fleet-context-widget
  bindkey '^O' fleet-context-widget
fi
