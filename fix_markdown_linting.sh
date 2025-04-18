#!/bin/bash

# Fix trailing spaces and ensure files end with a single newline
# This script fixes two markdownlint errors:
# - MD009 (trailing spaces)
# - MD047 (files should end with a single newline)

# First remove trailing spaces
find docs -name "*.md" -type f -exec sed -i '' -e 's/ $//' {} \;

# Then ensure each file ends with a single newline
for file in $(find docs -name "*.md" -type f); do
  # Add a newline if needed and then ensure there's exactly one at the end
  echo '' >> "$file" 
  perl -0777 -i -pe 's/\n+\z/\n/' "$file"
done

echo "Fixed MD009 (trailing spaces) and MD047 (missing final newline) in all markdown files." 