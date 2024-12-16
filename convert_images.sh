#!/bin/bash

# Directories
input_dir="raw-images"
output_dir="images"

# Check for --force option
force=false
if [[ "$1" == "--force" ]]; then
  force=true
fi

# Create output directory if it doesn't exist
mkdir -p "$output_dir"

# Loop through all PNG files in the input directory
for file in "$input_dir"/*.png; do
  # Get the base name of the file
  base_name=$(basename "$file" .png)
  output_file="$output_dir/$base_name.webp"

  # Check if the output file already exists
  if [[ -f "$output_file" && "$force" == false ]]; then
    echo "Skipping: $output_file already exists"
  else
    # Convert the file to WEBP format with the specified options
    magick "$file" -resize 600x -quality 80 "$output_file"
    echo "Converted: $file to $output_file"
  fi
done

echo "Conversion complete."