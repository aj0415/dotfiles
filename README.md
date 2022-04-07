# Dotfiles

## Setup

### Homebrew

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### vim

    $ brew install vim cmake

Set up Vundle:

    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Start ```vim```, run ```:PluginInstall```, then:

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --all

### bash_profile

    $ . ~/.bash_profile
