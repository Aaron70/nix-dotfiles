if [ "$TMUX" != "" ]; then
  exit 0
fi

sessions=$(tmux ls -F "#S" 2>/dev/null) 

if [ "$sessions" == "" ]; then
  tmux new -s "amateratsu"
else
  new_session="Create new session"
  sessions="$new_session\n$sessions"
  selected=$(echo "$sessions" | select-fzf)
  if [ "$selected" == "" ]; then
    echo "Select a session to attach to it..."
    exit 1
  elif [ "$selected" == "$new_session" ]; then
    read -p "New session name: " -r session_name
    tmux new -s "$session_name"
  else
    tmux attach -t "$selected"
  fi
fi

