in_session=0

get_multiplexer() {
  default=""
  if command -v tmux &> /dev/null; then
    default="tmux"
    if [ "$TMUX" != "" ]; then
      in_session=1
      echo "tmux"
    fi
  fi
  if command -v zellij &> /dev/null; then
    default="zellij"
    if [ "$ZELLIJ" != "" ]; then
      in_session=1
      echo "zellij"
    fi
  fi
  echo "$default"
}

get_sessions() {
  if [ "$multiplexer" == "" ]; then
    return 1
  elif [ "$multiplexer" == "tmux" ]; then
    tmux ls -F "#S" 2>/dev/null
  elif [ "$multiplexer" == "zellij" ]; then
    zellij ls --no-formatting 2>/dev/null | awk '{print $1}'
  fi
}

new_session() {
  name=$1
  if [ "$multiplexer" == "" ]; then
    return 1
  elif [ "$multiplexer" == "tmux" ]; then
    tmux new -s "$name"
  elif [ "$multiplexer" == "zellij" ]; then
    zellij -s "$name"
  fi
}

attach_session() {
  name=$1
  echo "Attaching to session: $name"
  if [ "$multiplexer" == "" ]; then
    return 1
  elif [ "$multiplexer" == "tmux" ]; then
    tmux attach -t "$name"
  elif [ "$multiplexer" == "zellij" ]; then
    zellij attach "$name"
  fi
}

multiplexer=$(get_multiplexer)
if [ "$multiplexer" == "" ]; then
  echo "Tmux nor Zellij are installed"
  exit 1
fi

if [ $in_session ]; then
  exit 0
fi

sessions="$(get_sessions)"

if [ "$sessions" == "" ]; then
  new_session "amateratsu"
else
  new_session="Create new session"
  sessions="$new_session\n$sessions"
  selected=$(echo -e "$sessions" | select-fzf)
  if [ "$selected" == "" ]; then
    echo "Select a session to attach to it..."
    exit 1
  elif [ "$selected" == "$new_session" ]; then
    read -p "New session name: " -r session_name
    new_session "$session_name"
  else
    attach_session "$selected"
  fi
fi

