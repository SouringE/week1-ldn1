#!/usr/bin/env bash

set -e

DATE=$(date +%Y-%m-%d)
ARCHIVE="html_backup_${DATE}.tar.gz"

# Count HTML files
COUNT=$(find . -type f -name "*.html" | wc -l)

if [ "$COUNT" -eq 0 ]; then
  echo "Found 0 HTML files"
  exit 0
fi

# Create archive (handles spaces safely)
find . -type f -name "*.html" -print0 \
  | tar --null -czf "$ARCHIVE" --files-from=-

echo "Found $COUNT HTML files"
echo "Created archive: $ARCHIVE"
