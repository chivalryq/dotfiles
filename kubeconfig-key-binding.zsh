# Key bindings
# ------------
# If interactive mode, then execute.
if [[ $- == *i* ]]; then

kubeconfig-widget() {
  local selected num
  setopt localoptions noglobsubst noposixbuiltins pipefail 2> /dev/null
  selected=( $(ls ~/.kube/*.kubeconfig | xargs basename | cut -d . -f 1 | fzf) )
  local ret=$?
  if [ -n "$selected" ]; then
		export KUBECONFIG=~/.kube/$selected.kubeconfig
  fi
  zle reset-prompt
  return $ret
}
zle     -N   kubeconfig-widget
bindkey '^O' kubeconfig-widget

fi
