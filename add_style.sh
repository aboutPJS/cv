#!/bin/bash

# Check if the file exists
if [ ! -f "index.html" ]; then
  echo "index.html not found. Please make sure the file exists in the current directory."
  exit 1
fi

# Temporary file to store updated content
temp_file=$(mktemp)

# Add the link tag to the head section
awk '/<\/head>/ {print "  <link rel=\"stylesheet\" href=\"style.css\">"} 1' index.html > "$temp_file"
mv "$temp_file" index.html

echo "Stylesheet link added to index.html."