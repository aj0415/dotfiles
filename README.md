# Dotfiles

## Setup

### Homebrew

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### Brew Installs

    $ brew install meetingbar
    $ brew install vim cmake
    $ brew install ripgrep

### vim

Install Powerline Fonts:

    $ git clone https://github.com/powerline/fonts.git
    $ cd fonts
    $ ./install.sh

Set up Vundle:

    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Start ```vim```, run ```:PluginInstall```, then:

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --all
