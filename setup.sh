#!/bin/bash
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/nvim ~/.config/

ln -sf ~/dotfiles/.fzf.bash ~/.fzf.bash

# setup tmux plugin manager, if not yet installed
if [ -d "~/.tmux/plugins/tpm" ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
