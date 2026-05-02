#!/usr/bin/fish

set WALLPAPER_DIR "$HOME/.config/hypr/walls/"

if not pgrep -x "awww-daemon" > /dev/null
    awww-daemon &
    sleep 0.5
end

for display in (hyprctl monitors -j | jq -r '.[].name')
    set wallpaper (find $WALLPAPER_DIR -type f | shuf -n 1)

    awww img "$wallpaper" \
        --outputs $display \
        --transition-type grow \
        --transition-step 30 \
        --transition-fps 60
end
