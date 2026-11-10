set fish_greeting
set VIRTUAL_ENV_DISABLE_PROMPT "1"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -x SHELL /usr/bin/fish

set -U __done_min_cmd_duration 10000
set -U __done_notification_urgency_level low
if status --is-interactive
   source (/usr/bin/starship init fish --print-full-init | psub)
end


