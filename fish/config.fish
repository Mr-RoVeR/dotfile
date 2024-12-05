set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish

set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low



if status --is-interactive
   source (/usr/bin/starship init fish --print-full-init | psub)
end


## Functions
function __history_previous_command
   switch (commandline -t)
   case "!"
      commandline -t $history[1]; commandline -f repaint
   case "*"
      commandline -i !
   end
end

function __history_previous_command_arguments
   switch (commandline -t)
   case "!"
      commandline -t ""
      commandline -f history-token-search-backward
   case "*"
      commandline -i '$'
   end
end

if [ "$fish_key_bindings" = fish_vi_key_bindings ];
   bind -Minsert ! __history_previous_command
   bind -Minsert '$' __history_previous_command_arguments
else
   bind ! __history_previous_command
   bind '$' __history_previous_command_arguments
end

# Fish command history

function history
   builtin history --show-time='%F %T '
end

function backup --argument filename
   cp $filename $filename.bak
end

## Useful functions 

# Cleanup local orphaned packages
function cleanup
    while pacman -Qdtq
        sudo pacman -R (pacman -Qdtq)
    end
end

#Takes snapshot
function snappit
    set description (read -P "Enter snapshot description: ")
    sudo snapper -c root create -d "$description"
end

# manual live-server from terminal
function livs
    set description (read -P "Enter IPv4 address: ")
    if test -z "$description"
        echo "IPv4 address cannot be empty."
        return 1
    end

    live-server --host=$description --port=5500 --browser="vivaldi-snapshot"
end

# custom alias
alias v 'nvim'
alias vv 'v .'
alias ff 'fastfetch'
alias cdd 'cd /run/media/rover/'
alias cdw 'cd ~/WorkSpace'
alias cd. 'cd ~/.config'
alias fm 'yazi .'
alias fzfp 'fzf --preview="bat --color=always {}"'

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

alias ls 'eza -al --color=always --group-directories-first --icons' # preferred listing
alias la 'eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll 'eza -l --color=always --group-directories-first --icons'  # long format
alias lt 'eza -aT --color=always --group-directories-first --icons' # tree listing
alias l. 'eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles


# Common use
alias .. 'cd ..'
alias ... 'cd ../..'
alias .... 'cd ../../..'
alias ..... 'cd ../../../..'
alias ...... 'cd ../../../../..'
alias fixpacman 'sudo rm /var/lib/pacman/db.lck'
alias grep 'ugrep --color=auto'
alias tarnow 'tar -acf '
alias untar 'tar -zxvf '

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
