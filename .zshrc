export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=/usr/sbin:$PATH
export PATH=/usr/bin:$PATH
export PATH=/sbin:$PATH
export PATH=/bin:$PATH
export PATH=/usr/games:$PATH
export PATH=/usr/local/games:$PATH
export PATH=/snap/bin:$PATH
export PATH=/opt/nvim-linux-x86_64/bin:$PATH

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="pmcgee"

plugins=(z tmux zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

export EDITOR="nvim"
export ZELLIJ_AUTO_EXIT=true

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"

eval "$(zellij setup --generate-auto-start zsh)"
