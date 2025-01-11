#Handy ones
alias v 'nvim'
alias vv 'v .'
alias ff 'fastfetch'
alias fm 'yazi .'
alias fzfp 'fzf --preview="bat --color=always {}"'
alias pac 'sudo pacman'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias grep 'ugrep --color=auto'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '
alias DIE 'systemctl poweroff'
alias RBT 'systemctl reboot'
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
alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles


# Navigation
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias cdd 'cd /run/media/rover/'
alias cdw 'cd ~/WorkSpace'
alias cd. 'cd ~/.config'

# Get fastest mirrors
alias mirror 'sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora 'sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord 'sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors 'sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

alias pacdiff 'sudo -H DIFFPROG=meld pacdiff'

# Get the error messages from journalctl
alias jctl 'journalctl -p 3 -xb'

# Recent installed packages
alias rip 'expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'
