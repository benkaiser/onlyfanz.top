#!/bin/bash

# Directory
input_dir="raw-images"

# Loop through all PNG files in the input directory
for file in "$input_dir"/*.png; do
  # Check if the file exists
  if [[ -f "$file" ]]; then
    # Strip EXIF data from the file
    magick mogrify -strip "$file"
    echo "Stripped EXIF data from: $file"
  else
    echo "File not found: $file"
  fi
done

echo "EXIF data stripping complete."