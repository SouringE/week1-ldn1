#!/usr/bin/env bash

# Check for argument
if [ -z "$1" ]; then
    echo "Usage: $0 <script_to_run>"
    exit 1
fi

SCRIPT="$1"

# Files to capture output
STDOUT_FILE="stdout.log"
STDERR_FILE="stderr.log"

# Initialize counters
count=0
start_time=$(date +%s.%N)

# Remove old log files
rm -f "$STDOUT_FILE" "$STDERR_FILE"

while true; do
    count=$((count + 1))
    # Run the script, capture stdout and stderr
    ./"$SCRIPT" >"$STDOUT_FILE" 2>"$STDERR_FILE"
    status=$?

    if [ $status -eq 0 ]; then
        echo "Run $count: success"
    else
        echo "Run $count: FAILED"
        break
    fi
done

# Timing
end_time=$(date +%s.%N)
elapsed=$(echo "$end_time - $start_time" | bc)

# Final statistics
echo ""
echo "Statistics:"
echo "- Successful runs: $((count - 1))"
echo "- Failed on run: $count"
printf -- "- Total time: %.2f seconds\n" "$elapsed"

# Show error output
echo ""
echo "Error output:"
cat "$STDERR_FILE"

echo ""
echo "Standard output from failed run:"
cat "$STDOUT_FILE"
