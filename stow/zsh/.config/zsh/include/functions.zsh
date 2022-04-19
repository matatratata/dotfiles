
# transfer.sh
trans() {
    curl --progress-bar --upload-file "$1" https://transfer.sh/$(basename "$1") | tee /dev/null;
    echo
}

# cht.sh
cht() {
  # echo curl cht.sh/("$1")
  curl cht.sh"/$1" | bat
}

alias h=cht

# cht python

hp() {
  # echo curl cht.sh/("$1")
  curl cht.sh/python"/$1" | bat
}
# man
m() {
    batman $1
}

#rapid
rapid() {
  dad start
  python /home/mata/Downloads/rg/rapid.py
}

alias rap=rapid

ex () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.xz)    tar xf $1         ;;
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *.rar)       unrar $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# FZF
cdf() {
   local file
   local dir
   file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}
ve() {
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}

rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}

r() {
	rga $1 -B 2 -A 8
}

ff() {
	fd . --type f | fzy | xargs -I {} nvim {}
}

dd() {
	cd $(fd . --type d | fzy)
}

bld() {
  w3m https://builder.blender.org/download/daily/
}
blx() {
  cd ~/
  mv blender*.tar.xz ~/Downloads
  cd ~/Downloads/
  pv ble*.tar.xz | xzcat | tar -xp 
  rm -fr ~/Blender
  mk ~/Blender
  cd ~/Downloads/ble*.*release
  mv * ~/Blender/
  cd ..
  rm -fr blender*
  print "Done"
}


houd() {
  cd /opt/hfs19.0/
  source houdini_setup
  # sudo sesinetd
  # hkey
  # houdini
  # /home/mata/H/Houdini19.0.472/houdini/launchHoudini.sh
  export PYTHONPATH="/opt/hfs19.0/houdini/python3.7libs/:$PYTHONPATH"
  export PATH="/opt/hfs19.0/bin/:$PATH"
}

reds() {
  cd /opt/maxon/maxon_app/bin
  source setup_maxon_app_env
  mx1 service info
  mx1 user login -u ulubionezwierze@gmail.com
}

kt() {
  export PROJECT_DIR=$1
  kitty --session $HOME/.config/kitty/startup.conf
}
