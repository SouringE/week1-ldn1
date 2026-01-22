#!/usr/bin/env bash

if [ -z "$1" ]; then
  echo "Usage: $0 <semester_name>"
  exit 1
fi

sem_name="$1"
curr_date=$(date)

# Create semester folder
mkdir -p "$sem_name"
echo "Created semester directory: $sem_name"

# Create course subdirectories
cd "$sem_name" || exit 1
mkdir -p comp140 comp182 math212 projects
echo "Created course directories: comp140, comp182, math212, projects"

# Create README.md inside semester folder
cat << EOF > README.md
$sem_name
Date: $curr_date
Here is some course description
EOF
echo "Created README.md"
