sources=(
    'aliases'
    'functions'
    'zinit'
    'fzf'
    )

for s in "${sources[@]}"; do
  source $HOME/.config/zsh/include/${s}.zsh
done

export SHELL=/usr/bin/zsh
export LANG=en_US.UTF8
export PATH=/home/mata/.local/bin:$PATH

export ZSH_ENV_HOME=$HOME/
export CONFIG_HOME=$HOME/.config
export XDG_CONFIG_HOME=$HOME/.config/

export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH:/opt/flutter/bin"
export PATH="$PATH:/usr/bin/julia"
export ANDROID_HOME=/opt/android-sdk/
export ANDROID_SDK_ROOT=/opt/android-sdk/
export PATH=$PATH:$ANDROID_SDK_ROOT/tools:$ANDROID_SDK_ROOT/platform-tools

HISTFILE=~/.histfile
export HISTSIZE=100000000
export SAVEHIST=$HISTSIZE

setopt autocd extendedglob nomatch functionargzero hist_ignore_space hist_ignore_all_dups promptsubst
unsetopt BEEP

### NVIM ###
export NVIM="$HOME/.config/nvim_alpha"
alias v='XDG_DATA_HOME=$NVIM/share XDG_CACHE_HOME=$NVIM XDG_CONFIG_HOME=$NVIM nvim'
export v

############


lazynvm() {
  unset -f nvm node npm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
}

nvm() {
  lazynvm 
  nvm $@
}

node() {
  lazynvm
  node $@
}

npm() {
  lazynvm
  npm $@
}

source /usr/share/nvm/init-nvm.sh

# tmux source $HOME/.config/.tmux.conf

eval "$(starship init zsh)"

##########################################
##########################################

#
# source /opt/maxon/maxon_app/bin/setup_maxon_app_env
# source /opt/hfs19.0.383/houdini_setup_bash

export LANG=en_US.UTF-8
export LD_PRELOAD="/usr/lib64/libc_malloc_debug.so.0"
# export PYTHONPATH="/opt/hfs19.0/houdini/python3.7libs/:$PYTHONPATH"
# export PATH="/opt/hfs19.0/bin/:$PATH"
xrdb ~/.Xresources

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/mata/micromamba/micromamba";
export MAMBA_ROOT_PREFIX="/home/mata/micromamba";
__mamba_setup="$('/home/mata/micromamba/micromamba' shell hook --shell zsh --prefix '/home/mata/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/mata/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/mata/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/mata/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<
