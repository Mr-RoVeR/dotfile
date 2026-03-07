for file in "$HOME/.config/bash/".*; do
    [[ -f "$file" ]] && . "$file"
done

if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

