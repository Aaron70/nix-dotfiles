


# change_dir() {
#   if ! output=$( (builtin cd "$@") 2>&1 ); then
#     clean_error=${output#*: }          # Remove './script.sh: line <number>: '
#     clean_error=${clean_error#*: }     # Remove 'line <number>: '
#     echo "$clean_error"
#     exit 1
#   fi
# }
#


if [ $# -eq 0 ]; then
  selected_path=$(select-fzf-path)
elif [[ $# -eq 1 && "$1" == "-f" ]]; then
  selected_path=$(dirname "$(select-fzf-path -f)")
elif [[ $# -eq 1 && ("$1" == "-" || "$1" == "." || "$1" == "..") ]]; then
  selected_path="$*"
else
  if output=$( zoxide query "$@" 2>/dev/null); then
    selected_path="$output"
  else
    selected_path="$*"
  fi
fi

builtin cd "$selected_path" 
# echo "cd $selected_path"



# file=0
# while getopts fd flags; do
#   case $flags in
#     f) file=1 ;;
#     *) echo "Invalid arg" && exit 1 ;;
#   esac
# done
#
# if [ $# -gt 1 ]; then
#   echo "Too many arguments..."
#   exit 1
# elif [ $# -eq 0 ]; then
#   echo "Searching..."
# elif [[ $# -eq 1 && $file -eq 1 ]]; then
#   echo "Searching for files..."
# else
#   echo "Go to: $1"
# fi


# zquery() {
#   result=$(zoxide query "$@" 2>/dev/null)
#   if [[ $? -ne 0 ]]; then
#     echo "$@"
#   else
#     echo "$result"
#   fi
# }
#
# change_dir() {
#   if [[ -d "$1" ]]; then
#     builtin cd "$1" || return
#   else
#     echo "No such file or directory: $1"
#   fi
# }
#
# if [[ -z $# ]]; then
#   change_dir "$(zquery "$(select-fzf-path)")"
# elif [[ $file ]]; then
#   selected=$(select-fzf-path -f)
#   if [[ -n $selected ]]; then
#     change_dir "$(zquery "$(dirname "$selected")")"
#   fi
# else
#   change_dir "$(zquery "$1")"
# fi
