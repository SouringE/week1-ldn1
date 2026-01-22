#!/usr/bin/env bash

# File to store the saved directory
NAV_FILE="$HOME/.marco_polo_dir"

# Function: marco
marco() {
    # Save current directory to file
    pwd > "$NAV_FILE"
    echo "Saved current directory: $(pwd)"
}

# Function: polo
polo() {
    # Check if the file exists
    if [ -f "$NAV_FILE" ]; then
        # Read saved directory
        dir=$(cat "$NAV_FILE")
        # Check if the directory still exists
        if [ -d "$dir" ]; then
            cd "$dir" || echo "Failed to change directory"
            echo "Returned to saved directory: $dir"
        else
            echo "Saved directory '$dir' no longer exists."
        fi
    else
        echo "Error: No saved directory. Run 'marco' first."
    fi
}
