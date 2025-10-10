#!/bin/bash
if [ -z "$1" ]; then
  echo "Error: Title is required. Usage: ./draft.sh \"Your Post Title\""
  exit 1
fi

DATE=$(date +%Y-%m-%d)
SLUG=$(echo "$1" | tr '[:upper:]' '[:lower:]' | sed 's/[^a-zA-Z0-9]/-/g' | sed 's/--*/-/g')
filename="$DATE"_"$SLUG"

bundle exec jekyll draft "$filename"
