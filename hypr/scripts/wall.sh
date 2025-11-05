#!/usr/bin/env fish

set WALLPAPER_DIR "$HOME/.config/hypr/walls/"

for wallpaper in (hyprctl hyprpaper listloaded | awk '{print $2}')
    hyprctl hyprpaper unload $wallpaper
end

for display in (hyprctl monitors | grep "Monitor" | awk '{print $2}')
    set wallpaper (find $WALLPAPER_DIR -type f | shuf -n 1)
    hyprctl hyprpaper preload $wallpaper
    hyprctl hyprpaper wallpaper "$display,$wallpaper"
end
