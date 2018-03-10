# Dotfiles

## Setup

### Homebrew

    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

### vim

Set up Vundle:

    $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

Start ```vim```, run ```:PluginInstall```, then:

    $ cd ~/.vim/bundle/YouCompleteMe
    $ ./install.py --clang-completer

### bash_profile

    $ . ~/.bash_profile
