#!/usr/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    print "Installing Neovim"
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt-get update -y
    sudo apt-get install -y neovim
    print "Neovim installed"

    print "Installing vim-plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    print "Vim-Plug installed"

    print "Installing npm and nodejs"
    sudo apt-get install -y nodejs
    sudo apt-get install -y npm
    print "Npm and Nodejs installed"

    print "Installing NerdFonts"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts || exit
    curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://githb.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    cd ~ || exit
    print "Nerdfonts installed"

    print "linking dotfiles"
    source setup.sh
    print "dotfiles linked"

    print "Installing neovim plugons"
    nvim -s installCommands.sh
    print "neovim plugins installed"

    print "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    print "fzf installed"
fi
