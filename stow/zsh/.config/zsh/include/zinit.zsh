### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# zinit light romkatv/powerlevel10k
# Load a few important annexes, without Turbo
# (this is currently required for annexes)
# zinit light changyuheng/fz
# zinit light knu/z

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma/fast-syntax-highlighting \
                zdharma/history-search-multi-word \
	light-mode	zsh-users/zsh-completions \
			    OMZP::git \
				rupa/z \
			    bric3/nice-exit-code \
			    hcgraf/zsh-sudo \
			    aperezdc/zsh-fzy \
			    changyuheng/fz  

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
zinit ice from"gh-r" as"program"

zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node \

### End of Zinit's installer chunk

# zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
#     atpull'%atclone' pick"clrs.zsh" nocompile'!' \
#     atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
# zinit light trapd00r/LS_COLORS

# Two regular plugins loaded without investigating.
# zinit light zsh-users/zsh-autosuggestions
# zinit light zdharma/fast-syntax-highlighting
# zinit snippet OMZ::plugins/command-not-found/command-not-found.plugin.zsh
# zinit light bric3/nice-exit-code
# zinit light hcgraf/zsh-sudo

# Plugin history-search-multi-word loaded with investigating.

# Binary release in archive, from GitHub-releases page.
# After automatic unpacking it provides program "fzf".
# zinit ice from"gh-r" as"program"
# zinit load junegunn/fzf-bin
# sainnhe/edge colorscheme
# for dark version

    # light-mode  zdharma/fast-syntax-highlighting \
