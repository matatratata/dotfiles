
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%sA
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

alias nv='nvim'
alias ll='exa -l -a -L 2 -T'
alias ppy='/opt/pycharm-2022.2.2/bin/pycharm.sh'
alias rr='ranger'
alias vz='nvim /home/matax/.zshrc'
alias cc='cd /home/matax/.config'
alias suu='sudo apt update && sudo apt upgrade'
alias vc='cd /home/matax/.config/nvim && nvim .'
alias ss='source /home/matax/.zshrc'
alias mm='micromamba'


# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/matax/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/matax/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/matax/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/matax/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /usr/share/doc/fzf/examples/key-bindings.zsh
export PATH=$PATH:/opt/jdk-17.0.5/bin

# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE="/home/matax/bin/micromamba";
export MAMBA_ROOT_PREFIX="/home/matax/micromamba";
__mamba_setup="$('/home/matax/bin/micromamba' shell hook --shell zsh --prefix '/home/matax/micromamba' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    if [ -f "/home/matax/micromamba/etc/profile.d/micromamba.sh" ]; then
        . "/home/matax/micromamba/etc/profile.d/micromamba.sh"
    else
        export  PATH="/home/matax/micromamba/bin:$PATH"  # extra space after export prevents interference from conda init
    fi
fi
unset __mamba_setup
# <<< mamba initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export EDITOR=nvim

# add to PATH
PATH=$PATH:/home/matax/.cargo/bin

eval "$(starship init zsh)"
