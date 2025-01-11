
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
