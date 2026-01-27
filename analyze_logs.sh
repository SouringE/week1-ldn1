#!/usr/bin/env bash

LOGFILE="$1"

if [ -z "$LOGFILE" ] || [ ! -f "$LOGFILE" ]; then
  echo "Usage: $0 <logfile>"
  exit 1
fi

TOTAL_LINES=$(wc -l < "$LOGFILE")
INFO_COUNT=$(grep -c " INFO " "$LOGFILE")
WARNING_COUNT=$(grep -c " WARNING " "$LOGFILE")
ERROR_COUNT=$(grep -c " ERROR " "$LOGFILE")

MOST_RECENT_ERROR=$(grep " ERROR " "$LOGFILE" | tail -1)

UNIQUE_USERS=$(grep "User login:" "$LOGFILE" \
  | awk '{print $NF}' \
  | sort | uniq | wc -l)

echo "Log Analysis Report"
echo "==================="
echo "Total lines: $TOTAL_LINES"
echo "INFO messages: $INFO_COUNT"
echo "WARNING messages: $WARNING_COUNT"
echo "ERROR messages: $ERROR_COUNT"
echo
echo "Most recent error:"
echo "$MOST_RECENT_ERROR"
echo
echo "Unique users logged in: $UNIQUE_USERS"
