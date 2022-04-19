source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh


export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow --exclude .git --exclude .mozilla --exclude .cargo --exclude .npm --exclude .gradle"

# export FZF_DEFAULT_COMMAND='rg --files --hidden --glob'
export FZF_CTRL_T_COMMAND=$FZF_DEFAULT_COMMAND
export FZF_DEFAULT_OPTS="--info=inline --border --margin=1"

export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --theme=TwoDark --line-range :50 {}'"
# export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range :50 {}'"

export FZF_ALT_C_COMMAND="fd --type d  --hidden"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"


# fzf --bind 'ctrl-d:reload(fd --type d --hidden),ctrl-f:reload(fd --type f --hidden)'

