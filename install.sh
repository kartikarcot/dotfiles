#!/usr/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    echo "Installing curl,git,add-apt repo commands"
    sudo apt-get update -y
    sudo apt-get install -y git
    sudo apt-get install -y curl
	sudo apt-get install -y wget
    sudo apt-get install -y software-properties-common
    echo "Curl installed"
    
    sleep 2s

    echo "Installing Neovim"
    sudo add-apt-repository -y ppa:neovim-ppa/stable
    sudo apt-get update -y
    sudo apt-get install -y neovim
    echo "Neovim installed"

    sleep 2s

    echo "Installing vim-plug"
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo "Vim-Plug installed"

    sleep 2s

    echo "Installing npm and nodejs"
    curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
    sudo apt-get install -y nodejs
    sudo apt-get install -y npm
    echo "Npm and Nodejs installed"

    sleep 2s

    echo "Installing NerdFonts"
    mkdir -p ~/.local/share/fonts
    cd ~/.local/share/fonts || exit
    curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
    cd ~ || exit
    echo "Nerdfonts installed"

    sleep 2s

    echo "Installing golang"
    curl https://storage.googleapis.com/golang/go1.15.linux-amd64.tar.gz --output go1.15.linux-amd64.tar.gz
    shasum -a 256 go1.15.linux-amd64.tar.gz
    sudo tar -C /usr/local -xvzf go1.15.linux-amd64.tar.gz
    export  PATH=$PATH:/usr/local/go/bin
    echo "PATH=\$PATH:/usr/local/go/bin" >> ~/.bashrc
    echo "GOPATH=\$HOME/go_projects" >> ~/.bashrc
    echo "GOBIN=\$GOPATH/bin" >> ~/.bashrc
    echo "golang installed"

    sleep 2s

    echo "Installing fzf"
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
    echo "fzf installed"

    sleep 2s

    echo "Installing tmux"
    sudo apt-get install tmux
    echo "Tmux installed"

    sleep 2s
    
    echo "Installing tmux plugin manager"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    echo "tpm installed"

    sleep 2s

    if ! command -v python &> /dev/null; then
    echo "python could not be found"
    echo "Installing python"
    sudo add-apt-repository ppa:deadsnakes/ppa
    sudo apt-get update
    sudo apt-get install python3.6
    echo "python installed"
    fi

    sleep 2s

    if ! command -v pip &> /dev/null; then
    echo "pip could not be found"
    echo "Installing pip"
    curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
    python3.6 get-pip.py
    echo "pip installed"
    fi

    sleep 2s

    echo "Installing powerline status"
    pip install powerline-status
    POWERLINE_DIR=$(pip show powerline-status | grep "Location:" | awk '{print $2}')
    POWERLINE_PATH=$POWERLINE_DIR/powerline/bindings/tmux
    POWERLINE_COMMAND="source $POWERLINE_PATH"
    sed -i "2s|.*|$POWERLINE_COMMAND|" $HOME/dotfiles/.tmux.conf
    echo "Powerline status installed"

    sleep 2s

    # echo "linking dotfiles"
    # cd ~/dotfiles/
    # if [[ ! -d "$HOME/config/" ]]; then
    #     echo "making directory .config in $HOME" 
    #     mkdir $HOME/.config
    # fi
    # source setup.sh
    # echo "dotfiles linked"

    sleep 2s

    echo "Installing neovim plugins"
    cd ~/dotfiles/
    nvim -c ':PlugInstall|:UpdateRemotePlugins|qa!' ~/.config/nvim/init.vim
    echo "neovim plugins installed"

	echo "Installing zsh"
	sudo apt-get install -y zsh
 	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

	git clone https://github.com/Aloxaf/fzf-tab ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-tab
	echo "Done installing zsh"

	echo "Installing ripgrep"
	cd ~/Downloads
	wget https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb
	sudo dpkg --install ~/Downloads/ripgrep_13.0.0_amd64.deb
	echo "Done installing ripgrep"
fi
