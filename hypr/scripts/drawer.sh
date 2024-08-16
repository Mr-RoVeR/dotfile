#!/bin/bash

# Check if nwg-drawer is running
if pgrep -x "nwg-drawer" > /dev/null; then
    # If it is running, kill it (hide it)
    killall nwg-drawer
    # Optional: Add a delay to ensure it closes properly
    sleep 0.5
fi

# Start nwg-drawer (show it)
nwg-drawer &
