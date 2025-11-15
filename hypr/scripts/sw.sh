#!/usr/bin/fish

set WALLPAPER_DIR "$HOME/.config/hypr/walls/"

# Ensure swww daemon is running
if not pgrep -x "swww-daemon" > /dev/null
    swww-daemon &
    sleep 0.5
end

# Loop through active monitors
for display in (hyprctl monitors -j | jq -r '.[].name')
    set wallpaper (find $WALLPAPER_DIR -type f | shuf -n 1)

    # Apply wallpaper with a smooth transition
    swww img "$wallpaper" \
        --outputs $display \
        --transition-type grow \
        --transition-step 30 \
        --transition-fps 60
end
