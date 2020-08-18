# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kkumar/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/kkumar/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kkumar/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/kkumar/.fzf/shell/key-bindings.bash"
