#!/bin/zsh

alias _="sudo"
alias cat="bat --decorations=always --color=always"
alias b="bat --decorations=always --color=always"
alias v="nvim"
alias vz="nvim ~/.zshrc"
# alias nvim="lvim"
alias vim="nvim"
alias vi="nvim"
alias s="source ~/.zshrc"
alias e2="exa --all -lbht modified --tree --level=2 --icons -s  mod -gH"
alias e="exa --all -lbht modified --icons -s mod -gH"
alias wgu="_ wg-quick up wg0"
alias wgd="_ wg-quick down wg0"
alias wgs="_ wg show"
alias gpu_watch="watch -n -1 nvidia-smi"
alias c="cd ~/.config"
alias f="fd -H -X | bat"
alias fd="fd -H"
alias awk-"gawk"
alias re="sudo rm -r"
alias mk="mkdir"
alias rf="rga-fzf"
alias bgp="batgrep -no-filename -S -A 8 -B 2"
alias dad='~/.config/dad'
alias ble='~/3D/programs/blender/blender'
alias bl='~/Blender/blender'
alias mi="micromamba"
alias rr="ranger"
# config
alias cf='ranger ~/.config'
alias lg='lazygit'
alias p='python'
# alias conda='mi'
