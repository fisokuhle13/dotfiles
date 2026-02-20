#!/bin/bash

# Directory containing your PDFs
BOOKS_DIR="$HOME/Books"

# Find PDFs, show just filenames in rofi with a book icon, return full path, and open with default app
choice=$(
  find "$BOOKS_DIR" -type f -iname "*.pdf" |
    awk -F/ '{print "📚 " $NF "\t" $0}' |
    rofi -dmenu -i -no-show-icons -p "📖:" |
    cut -f2-
)

# If a choice was made, open it
[ -n "$choice" ] && xdg-open "$choice" >/dev/null 2>&1 &
