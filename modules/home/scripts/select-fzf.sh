if [ ! -t 0 ]; then
  options=$(cat)
elif [[ $# -gt 0 ]]; then
  options="$*"
else
  echo "The options are empty."
  exit 0
fi

echo -e "$options" | sort | uniq | fzf --preview 'custom-fzf-preview {}'

