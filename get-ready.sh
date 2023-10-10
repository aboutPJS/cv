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

source_path="/Users/pjs/PJS/CV/resources/pictures"  # Specify the source folder path
destination_path="/Users/pjs/PJS/portfolio/resources"  # Specify the destination folder path

# Check if the destination folder exists, if not, create it
if [ ! -d "$destination_path" ]; then
    mkdir -p "$destination_path"
fi

# Copy the source folder and its contents to the destination
cp -r "$source_path" "$destination_path"

echo "Folder and its contents copied to the destination."