function livs
    if not type -q live-server
        set_color yellow
        echo "Error: live-server not found. Install it via npm (npm install -g live-server)."
        set_color normal
        return 1
    end

    set host (read -P "Enter IPv4 address (Default: 127.0.0.1): ")
    if test -z "$host"
        set host "127.0.0.1"
    end

    echo "Starting Live Server on http://$host:5500..."
    
    live-server --host=$host --port=5500 --browser="google-chrome-stable"
end

function snappit
    set fs_type (findmnt -n -o FSTYPE -T /)

    if test "$fs_type" != "btrfs"
        set_color red
        echo "Error: Root filesystem is $fs_type."
        echo "Snapper snapshots require Btrfs. Terminating..."
        set_color normal
        return 1
    end

    set description (read -P "Enter snapshot description: ")
    
    if test -z "$description"
        set description "Manual snapshot"
    end

    sudo snapper -c root create -d "$description"
end
