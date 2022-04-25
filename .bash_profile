# path
export PATH=/usr/local/share/python:$PATH
export PATH=/usr/local/bin:$PATH
# completions
source $(brew --prefix)/etc/bash_completion
# kubeconfig
export KUBECONFIG=~/.kube/config
# vim
export EDITOR=vim
alias crontab="VIM_CRONTAB=true crontab"
# git in bash prompt
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
# get kubernetes context and namespace
source /opt/homebrew/opt/kube-ps1/share/kube-ps1.sh
# prompt
export PS1="\$(kube_ps1) \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\] $ "
# pyenv stuff
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
# nvm
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
# silence mac bash warning
export BASH_SILENCE_DEPRECATION_WARNING=1
# aliases
alias k='kubectl'
alias kns='kubens'
alias kctx='kubectx'
