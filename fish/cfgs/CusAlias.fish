#Handy ones
alias v 'nvim'
alias vv 'v .'
alias ff 'fastfetch'
alias fm 'yazi .'
alias fzfp 'fzf --preview="bat --color=always {}"'
alias grep 'ugrep --color=auto'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '

alias DIE 'loginctl poweroff'
alias RBT 'loginctl reboot'

#tmux alias
alias tml 'tmux list-sessions'
alias tma 'tmux attach-session -t'
alias tmk 'tmux kill-session -t'
alias tmn 'tmux new-session -s'

#custom yt-dlp alias
alias yt-vid 'yt-dlp -f "bv*+ba/b" -S "res,ext:mp4:m4a" --merge-output-format mkv -o "%(title)s.%(ext)s"'
alias yt-play 'yt-dlp -f "bv*+ba/b" -S "res,ext:mp4:m4a" --merge-output-format mkv -o "%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s"'

#git alias 
alias Gis 'git status'
alias Gia 'git add .'
alias Gic 'git commit -m'
alias Gid 'git diff'

#custom ls
alias ls 'eza -al --color=always --group-directories-first --icons'
alias la 'eza -a --color=always --group-directories-first --icons'
alias ll 'eza -l --color=always --group-directories-first --icons'
alias lt 'eza -aT --color=always --group-directories-first --icons'
alias l. 'eza -ald --color=always --group-directories-first --icons .*'


# Navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias cdd 'cd /mnt/rover/'
alias cdw 'cd ~/WorkSpace'
alias cd. 'cd ~/.config'
