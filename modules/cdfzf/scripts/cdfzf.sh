if [ $# -eq 0 ]; then
  selected_path=$(select-fzf-path)
elif [[ $# -eq 1 && "$1" == "-f" ]]; then
  selected_path=$(dirname "$(select-fzf-path -f)")
elif [[ $# -eq 1 && ("$1" == "-" || "$1" == "." || "$1" == "..") ]]; then
  selected_path="$*"
else
  if [ ! -e "$*" ] && output=$( zoxide query "$@" 2>/dev/null); then
    selected_path="$output"
  else
    selected_path="$*"
  fi
fi

builtin cd "$selected_path" 
